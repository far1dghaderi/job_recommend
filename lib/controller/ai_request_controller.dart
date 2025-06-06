import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:job_recommender/controller/ai_response_database_controller.dart';
import 'package:job_recommender/controller/data_source/remote/api_service.dart';
import 'package:job_recommender/model/ai_reposne_model.dart';
import 'package:job_recommender/model/ai_request_model.dart';
import 'package:job_recommender/model/job_recommadn_model.dart';
import 'package:job_recommender/utils/data_response_type.dart';

class AiRequestController {

  final ApiService apiService;
  final AiResponseDatabaseController aiResponseDatabaseController;

  AiRequestController({ ApiService? apiService, AiResponseDatabaseController? aiResponseDatabaseController,}) :
      apiService = apiService ?? GetIt.instance<ApiService>(),
      aiResponseDatabaseController = aiResponseDatabaseController ?? GetIt.instance<AiResponseDatabaseController>();

  Future<DataState> getAiResponse(AiRequestModel aiRequestModel)async{
    final DataState response = await apiService.post(apiService.endpoint, aiRequestModel.toJson());
    if(response is DataSuccess){

      final chatResponse = ChatResponse.fromJson(response.data.data);
      final String content = chatResponse.choices.first.message.content;
      final RegExp jsonBlock = RegExp(r'```json\s*(\{.*?\})\s*```', dotAll: true);
      final Match? match = jsonBlock.firstMatch(content);
      if(match == null)
        return DataFailed("مشکلی در دریافت پاسخ از سرور پیش امده است");
      
      final String embeddedJson = match.group(1)!;
      final Map<String, dynamic> jsonData = jsonDecode(embeddedJson);

      if (!jsonData.containsKey('data') || jsonData['data'] is! List)
        return DataFailed("فرمت پاسخ سرور اشتباه است");
      
      final List<dynamic> jobsData = jsonData['data'];
      final List<JobRecommendationModel> jobRecommendations = jobsData
          .map((job) => JobRecommendationModel.fromJson(job))
          .toList();

      for (var job in jobRecommendations) 
        await aiResponseDatabaseController.saveJobRecommendation(job);
      

      return DataSuccess(jobRecommendations);
    }
    else return DataFailed("مشکلی پیش امده برادر");
  }

}
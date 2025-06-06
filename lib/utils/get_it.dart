import 'package:get_it/get_it.dart';
import 'package:job_recommender/controller/ai_request_controller.dart';
import 'package:job_recommender/controller/ai_response_database_controller.dart';
import 'package:job_recommender/controller/data_source/local/local_database_service.dart';
import 'package:job_recommender/controller/data_source/remote/api_service.dart';


class Locator{

  static final GetIt _instance = GetIt.instance;

  static void setup() async {
    await LocalDatabaseService.initialize();

    _instance.registerSingleton<LocalDatabaseService>(LocalDatabaseService.instance);

    _instance.registerLazySingleton<ApiService>(() => ApiService());
    
    _instance.registerLazySingleton<AiResponseDatabaseController>(() => AiResponseDatabaseController());
    
    _instance.registerLazySingleton<AiRequestController>(
      () => AiRequestController( apiService: _instance<ApiService>(), aiResponseDatabaseController: _instance<AiResponseDatabaseController>(),),);

  }
}



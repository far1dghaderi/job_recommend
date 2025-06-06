

import 'package:dio/dio.dart';
import 'package:job_recommender/utils/data_response_type.dart';

class ApiService {

  final endpoint = 'https://openrouter.ai/api/v1/chat/completions';

  static const header = {
    "Content-Type": "application/json",
    'Authorization': 'Bearer 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',
  };

 static Dio dio = Dio(
    BaseOptions( headers: header));

 Future<DataState> get(String path, { ResponseType? responseType})async{
  try{
    final Response res = await dio.get(path,options: Options(responseType: responseType));
    if( res.statusCode == 200 || res.statusCode == 201 ) return DataSuccess(res);
    else return DataFailed(res.data); 
  }
  on DioException catch(e){
    return DataFailed((e.response?.data));
  }
  catch(e){ return DataFailed(e.toString()); }
}
  
 Future<DataState> post(String path, dynamic reqModel, { String? contentType} )async{
  try{
    final Response res = await dio.post(
      path, 
      data: reqModel,
      options: Options(
        contentType: contentType ?? 'application/json'
      ));
      
    if( res.statusCode == 200 || res.statusCode == 201 )return DataSuccess(res);
    else return DataFailed(res.data);
  }
  on DioException catch(e){
    return DataFailed((e.response?.data));
  }
  catch(e){ return DataFailed(e.toString()); }
}
  
}

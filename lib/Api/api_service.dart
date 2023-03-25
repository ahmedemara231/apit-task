import 'package:api_task/Api/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Apiservice
{
  late Dio _dio;

  Apiservice()
  {
    _dio = Dio(
      BaseOptions(
        baseUrl: Apiconstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      )
    );
  }

  Future<Response> get(@required String path, {Map<String, dynamic>? queryParms}) async
  {
    try
    {
      Response response = await _dio.get(path , queryParameters: queryParms);
      // ApiModel.fromJson(response.data);
      return response;
    } on DioError catch(error)
    {
     throw _handleError(error);
    }

  }
  Exception _handleError(DioError error)
  {
   late String errorMessage;
    if(error.type == DioErrorType.receiveTimeout)
      {
        errorMessage = 'time out';
      }else if(error.type == DioErrorType.badResponse)
        {
          errorMessage = 'bad response ${error.response?.statusCode} ${error.response?.statusMessage}';
        }else
          {
            errorMessage = 'network error';
          }
    print(errorMessage);
    return error;
  }
}
import 'package:api_task/Api/Api_model.dart';
import 'package:api_task/Api/api_service.dart';
import 'package:api_task/Api/constants.dart';
import 'package:dio/dio.dart';

class Repository
{
  Apiservice apiservice = Apiservice();
  Future<ApiModel> getRandomQuote()async
  {
    var map = await apiservice.get(Apiconstants.endPoint);
    return ApiModel.fromJson(map.data);
  }
  Future <List<ApiModel>> getTenRandom()async
  {
    Response response  = await apiservice.get(Apiconstants.tenRandom);
    return (response.data as List).map((e) => ApiModel.fromJson(e)).toList();
  }

  Future<ApiModel> byChar({required String character})async
  {
    Response response = await apiservice.get(Apiconstants.randomByChar,queryParms: {'name': character});
    return ApiModel.fromJson(response.data);
  }
  Future<ApiModel> getByTitle({required String title})async
  {
   Response response = await apiservice.get(Apiconstants.randomByTitle,queryParms: {'title' : title});
   return ApiModel.fromJson(response.data);
  }
  Future<List<ApiModel>> tenRandomByTitle(String title)async
  {
    Response response = await apiservice.get(Apiconstants.tenRandomByTitle,queryParms: {'title': title});
    return (response.data as List).map((e) => ApiModel.fromJson(e)).toList();
  }
  Future<List<ApiModel>> tenRandomByChar(String char)async
  {
    Response response = await apiservice.get(Apiconstants.randomByChar,queryParms: {'name' : char});
    return (response.data as List).map((e) => ApiModel.fromJson(e)).toList();
  }
}

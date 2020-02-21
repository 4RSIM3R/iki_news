import 'package:dio/dio.dart';
import 'package:iki_news/constant/constant.dart';
import 'package:iki_news/service/api_exceptions.dart';

class ApiService {
  ApiService() {
    dio = Dio(apiOptions);
  }

  BaseOptions apiOptions = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 10000,
    receiveTimeout: 10000,
    sendTimeout: 10000,
    responseType: ResponseType.json,
    headers: {
      'Content-Type': 'application/json',
    },
  );

  Dio dio;

  /// [GET] You Can Calling GET Method Here
  Future<Response> get(String url) async {
    return await _safeRequest(() => dio.get(url));
  }

  /// [_safeRequest] Is Some Mechanism To Throw Different Error
  /// In Example You Want To Throw Bussines Exception Like, No Data In Your API
  /// Or Throwing Unknown Exception Like 403, And Mor

  Future<Response> _safeRequest(Future<Response> Function() tryFetchData) async {
    Response response;
    try {
      // TODO : Processing Your Positive Data Here
      response = await tryFetchData();
    } catch (e) {
      // TODO : Procesing Your Error Data Here
      _processError(e);
    }
    return response;
  }

  ///[_processError] Processing Your Error As Easy As Throwing Away Memories
  ///With Your Girlfirend
  void _processError(e) {
    if (e is DioError) {
      // TODO : Handling Dio Error Like Different Response Data
      throw BussinessException.fromJson(e.response.data);
    } else {
      // TODO : Handling Unkwnonw Error
      throw UnknownException(message: e.toString());
    }
  }
}

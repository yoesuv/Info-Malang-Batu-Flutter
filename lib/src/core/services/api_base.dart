import 'package:dio/dio.dart';
import 'package:info_malang_batu_flutter/src/core/services/app_exceptions.dart';
import 'package:info_malang_batu_flutter/src/core/services/logging_interceptor.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:info_malang_batu_flutter/src/utils/app_helper.dart';

class ApiBase {
  ApiBase() {
    dio = Dio(options);
    if (isInDebugMode) {
      dio?.interceptors.add(LoggingInterceptor());
    }
  }

  Dio? dio;
  BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: timeOut,
    receiveTimeout: timeOut,
    sendTimeout: timeOut,
  );

  //handle get request
  Future<dynamic> get(String url) async {
    dynamic response;
    try {
      response = await dio?.get<dynamic>(url);
    } catch (e) {
      if (e is DioException) {
        throw AppException(dioException: e);
      } else {
        throw UnknownException(message: 'Unknown Exception');
      }
    }
    return response;
  }
}

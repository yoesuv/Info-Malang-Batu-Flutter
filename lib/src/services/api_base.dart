import 'package:dio/dio.dart';
import '../data/constants.dart';
import 'app_exceptions.dart';
import 'logging_interceptor.dart';

class ApiBase {

    ApiBase() {
        dio = Dio(options);
        dio.interceptors.add(LoggingInterceptor());
    }

    Dio dio;
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
    );

    //handle get request
    Future<dynamic> get(String url) async {
        dynamic response;
        try {
            response = await dio.get<dynamic>(url);
        } catch(e) {
            if (e is DioError) {
                throw AppException(dioError: e);
            } else {
                throw UnknownException(message: 'Unknown Exception');
            }
        }
        return response;
    }

}
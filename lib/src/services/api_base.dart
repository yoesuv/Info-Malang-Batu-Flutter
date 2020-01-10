import 'package:dio/dio.dart';
import 'app_exceptions.dart';
import '../data/constants.dart';

class ApiBase {

    Dio dio;
    BaseOptions options = new BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
    );

    ApiBase() {
        dio = Dio(options);
    }

    //handle get request
    Future<Response> get(String url) async {
        var response;
        try {
            response = await dio.get(url);
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

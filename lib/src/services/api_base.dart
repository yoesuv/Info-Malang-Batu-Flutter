import 'package:dio/dio.dart';
import 'network_client.dart';
import 'app_exceptions.dart';

class ApiBase {

    Dio dio;

    ApiBase() {
        dio = NetworkClient().dio;
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

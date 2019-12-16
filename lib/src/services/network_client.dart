import 'package:dio/dio.dart';
import '../data/constants.dart';

class NetworkClient {

    Dio dio;

    NetworkClient(){
        dio = Dio(options);
    }

    BaseOptions options = new BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
    );

}

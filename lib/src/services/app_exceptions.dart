import 'package:dio/dio.dart';

class AppException {

    AppException({this.dioError});
    final DioError dioError;

}

class UnknownException {

    UnknownException({this.message});
    final String message;

}

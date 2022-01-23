import 'package:dio/dio.dart';

class AppException {
  final DioError? dioError;

  AppException({this.dioError});
}

class UnknownException {
  final String? message;

  UnknownException({this.message});
}
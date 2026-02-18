import 'package:dio/dio.dart';

class AppException {
  final DioException? dioException;

  AppException({this.dioException});
}

class UnknownException {
  final String? message;

  UnknownException({this.message});
}

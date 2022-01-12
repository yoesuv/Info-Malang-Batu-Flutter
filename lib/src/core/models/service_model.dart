import 'package:info_malang_batu_flutter/src/core/services/app_exceptions.dart';

class ServiceModel<T> {

    ServiceModel.completed(this.data) : status = Status.COMPLETED;
    ServiceModel.error(this.message) : status = Status.ERROR;
    ServiceModel.dioError(this.error): status = Status.DIOERROR;

    Status status;
    T data;
    String message;
    AppException error;

}

enum Status { COMPLETED, ERROR, DIOERROR }
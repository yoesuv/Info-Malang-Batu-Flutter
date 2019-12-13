class ServiceModel<T> {

    T model;
    int statusCode = 0;
    String errorMessage = '';

    ServiceModel({this.model, this.statusCode, this.errorMessage});

}

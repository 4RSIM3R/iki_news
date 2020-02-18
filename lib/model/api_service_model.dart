import 'package:dio/dio.dart';
import 'package:iki_news/service/api_exceptions.dart';

enum Status { COMPLETED, ERROR, DIOERROR }

///[ApiServiceModel] There Is Some Global Model For Our Aplication
class ApiServiceModel<T> {
  ApiServiceModel.completed(this.data) : status = Status.COMPLETED;

  ApiServiceModel.error(this.data) : status = Status.ERROR;

  // TODO : Handling List Response Here
  factory ApiServiceModel.fromResponseList(Response response, T Function(List) fromJson) {
    final data = response.data;
    if (response.statusCode == 200) {
      // TODO : Parse Your Data Here
    } else {
      // TODO : Throw Bussiness Exception Here To UI
    }
  }

  Status status;
  T data;
  String message;
}

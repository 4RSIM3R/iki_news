/// [BussinessException] Is Some Mechanism To Handling Error Message From Your API
class BussinessException {
  BussinessException({this.status, this.code, this.message});

  factory BussinessException.fromJson(Map<String, dynamic> json) =>
      BussinessException(status: json['status'], code: json['code'], message: json['message']);

  final String status;
  final String code;
  final String message;
}

/// [UnknownException] Is Some Mechanism To Handling Your Unknown Exception
class UnknownException {
  UnknownException({this.message});
  final String message;
}

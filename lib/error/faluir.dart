import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMassage;
  Failure(this.errorMassage);
}

class ServerFailuar extends Failure {
  ServerFailuar(super.errorMassage);
  factory ServerFailuar.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuar("take a more time in server");
      case DioExceptionType.sendTimeout:
        return ServerFailuar("take a more time in server");
      case DioExceptionType.receiveTimeout:
        return ServerFailuar("take a more time in server");
      case DioExceptionType.badCertificate:
        return ServerFailuar("take a more time in server");
      case DioExceptionType.badResponse:
        return ServerFailuar.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailuar("take a more time in server");
      case DioExceptionType.connectionError:
        return ServerFailuar("take a more time in server");
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailuar('No Internet');
        }
        return ServerFailuar('i not know the error');
      default:
        return ServerFailuar("opps!");
    }
  }
  factory ServerFailuar.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailuar(response['error']['code'].toString());
    } else if (statusCode == 404) {
      return ServerFailuar("Your requst not found");
    } else if (statusCode == 500) {
      return ServerFailuar('tray later');
    } else {
      return ServerFailuar('Opps! ');
    }
  }
}

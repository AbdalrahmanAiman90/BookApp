import 'package:dio/dio.dart';

class ApiServes {
  final String _baseUrl = "https://www.googleapis.com/books/v1/volumes";
  final Dio dio;
  ApiServes(this.dio);

  Future<dynamic> get({Map<String, dynamic>? queryParams}) async {
    // do requst
    var response = await dio.get(_baseUrl, queryParameters: queryParams);
//decode requst
    return response.data;
  }
}

import 'package:dio/dio.dart';

class HttpClient {
  final httpClient = Dio(BaseOptions(
    baseUrl: "https://jsonplaceholder.typicode.com/",
  ));

  Future<Response> get(String path) async {
    return httpClient.get(path);
  }
}

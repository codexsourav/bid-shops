// ignore: file_names
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import '../Storage/Storage.dart';

class ApiRequest {
  final String method;
  final String path;
  final dynamic body;
  final String endPoint;

  ApiRequest({
    this.method = "GET",
    this.path = "/",
    this.body,
    this.endPoint = "http://43.205.94.12:8000",
  });

  Future<dio.Response> send() async {
    try {
      dio.Dio useDio = dio.Dio();
      UseLocalStorage storage = UseLocalStorage(storage: localStorage);
      String? jwtToken = await storage.getStorage(key: "authKey");
      dio.Response response = await useDio.request(
        "$endPoint$path",
        options: dio.Options(
          method: method,
          headers: {"Authorization": "barer $jwtToken"},
        ),
        data: body,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on dio.DioException catch (e) {
      if (e.response != null || e.response!.statusCode == 401) {
        await UseLocalStorage(storage: localStorage).cleanStorage();
      }
      rethrow;
    }
  }
}

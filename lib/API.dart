import 'package:dio/dio.dart';

class API{
  API._internal();
  static API _instance = API._internal();
  static API get instance => _instance;

  final _dio = Dio();

  final String url = "http://58ee-181-55-209-198.ngrok.io";

  Future getHttp(String path) async {
    try{
      final resp = await _dio.get(
        url + path,
      );
      return resp.data;
    }on DioError catch(e){
      print('Error');
      throw(e);
    }
  }

}
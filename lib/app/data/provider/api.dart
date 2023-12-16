import 'dart:convert' show jsonDecode, jsonEncode;
import 'dart:developer' show log;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg_frontend/app/data/provider/endpoints.dart';

final optHeader = {
  'content-type': 'application/json',
  'accept': 'application/json'
};

class ApiResponse {
  int statusCode;
  Map<String, dynamic> data;
  ApiResponse({required this.data, required this.statusCode});
}

class MyApi {

  static int requestTimeoutms = 20000;
  var client = InterceptedClient.build(
    requestTimeout: Duration(milliseconds: requestTimeoutms),
    interceptors: [],
  );
  MyApi._internal();

  static final _singleton = MyApi._internal();

  factory MyApi() => _singleton;

  Future<ApiResponse> post(String path, {Map<String, dynamic> data = const {}}) async {

    ApiResponse res = ApiResponse(data: {}, statusCode: -1);;

    try {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token != null) {
        optHeader['Authorization'] = 'Bearer $token';
      }

      final response = await client.post(
        "${Endpoints.ipApi}$path".toUri(),
        body: jsonEncode(data),
        headers: optHeader,
      );

      res.statusCode = response.statusCode;
      res.data = jsonDecode(response.body) as Map<String, dynamic>? ?? {};
      
      return res;
    } catch (e) {
      log('Error in post: $e');
      return res;
    }
  }

  
}
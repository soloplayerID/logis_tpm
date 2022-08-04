// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'dart:io';
import '../../helper/paths.dart';
import '../response/login_response.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<LoginResponse> connectToApi(String email, String password) async {
    try {
      String apiURL = "${Paths.baseurl}${Paths.login}";
      print(apiURL);

      var apiResult = await http.post(Uri.parse(apiURL),
          body: {"username": email, "password": password});
      var jsonObject = json.decode(apiResult.body);
      print(jsonObject);

      return LoginResponse.fromJson(jsonObject);
    } on SocketException {
      return Future.error("Yah, Internet Kamu error!😑");
    } on HttpException {
      print("Fungsi post ga nemu 😱");
      // return Future.error("Fungsi post ga nemu 😱");
      return Future.error("terjadi error");
    } on FormatException {
      print("Response format kacauu! 👎");
      // return Future.error("Response format kacauu! 👎");
      return Future.error("terjadi error");
    }
  }
}

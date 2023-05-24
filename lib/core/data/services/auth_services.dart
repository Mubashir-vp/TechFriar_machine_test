import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:machinetest_techfriar/core/blocs/auth_bloc/auth_bloc.dart';
import 'package:machinetest_techfriar/core/data/services/http_services.dart';
import 'package:machinetest_techfriar/core/models/usermodel.dart';

class AuthServices {
  HttpServices httpService = HttpServices();
  Future<AuthState?> loginUser({
    required String pass,
    required String phone,
  }) async {
    log('Logging phone $pass, $phone');
    String url =
        "https://dev.peg.techfriar.xyz/api/login_with_phone?phone=$pass&password=$phone";

    Map<String, String> header = {
      'access-control-allow-credentials': 'true',
      'access-control-allow-origin': 'http://localhost:3000',
      'cache-control': 'no-cache,private',
      'content-encoding': 'gzip',
      'content-type': 'application/json',
      'date': 'Wed,24 May 2023 06:33:32 GMT',
      'server': 'nginx',
      'vary': 'Accept-Encoding',
      'x-content-type-options': 'nosniff',
      'x-firefox-spdy': 'h2',
      'x-frame-options': 'SAMEORIGIN',
      'x-ratelimit-limit': '1000',
      'x-ratelimit-remaining': '999',
      'x-xss-protection': '1; mode=block',
      "Accept": "application/json"
    };
    http.Response response = await httpService.makePostRequest(
        url: url, headers: header, data: {"phone": phone, "password": pass});
    try {
      if (response.statusCode == 200) {
        log('Login User: Success');
        return Authenticated(
          userModel: userModelFromJson(
            response.body,
          ),
        );
      } else {
        log(
          'placeOrder: Failed: ${response.statusCode}: ${response.body}',
        );
        return FailedState(
          errorString: response.body,
        );
      }
    } catch (e) {
      log('Error occured $e');
    }
    return null;
  }
}

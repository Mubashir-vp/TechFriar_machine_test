import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class HttpServices {
  Future<http.Response> makePostRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? data,
  }) async {
    log('makePostRequest: url: $url');
    log('JSON data : ${json.encode(data)}');
    // log('Headers : $headers');
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await http.post(
        uri,
        body: json.encode(data),
        headers: headers,
      );
      return response;
    } catch (error) {
      log('error: url: $url');
      log('error: headers: $headers');
      log('error: data: ${json.encode(data)}');
      log('error: message : $error');
      rethrow;
    }
  }

  Future<http.Response> makeGetRequest({
    required String url,
    Map<String, String>? headers,
  }) async {
    log('makeGetRequest: url: $url');
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri, headers: headers);
      return response;
    } catch (error) {
      log('error: url: $url');
      log('error: headers: $headers');
      log('error: message : $error');
      rethrow;
    }
  }
}

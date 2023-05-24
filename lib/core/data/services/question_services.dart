import 'package:machinetest_techfriar/core/models/questionmodel.dart';
import 'package:http/http.dart' as http;

import 'http_services.dart';

class QuestionServices {
  HttpServices httpService = HttpServices();
  Future<QuestionModel?>? getQuestions() async {
    const url = 'https://dev.peg.techfriar.xyz/api/list_trending_questions';
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
    try {
      http.Response response =
          await httpService.makeGetRequest(url: url, headers: header);
      // dev.log('checking for response in product service ${response.body}',
      //     name: "Product_service.dart");
      if (response.statusCode == 404) {
        return null;
      }
      // dev.log('Checking the list of products in screen $responseData',
      //     name: "Product_service.dart");
      QuestionModel questionModel = questionModelFromJson(response.body);
      // dev.log(
      //     'Checking for productiteminshopmodels $orders',
      //     name: "Product_service.dart");

      return questionModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<QuestionModel?>? getPaginatedQuestions({required uri}) async {
    final url = uri;
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
    try {
      http.Response response =
          await httpService.makeGetRequest(url: url, headers: header);
      // dev.log('checking for response in product service ${response.body}',
      //     name: "Product_service.dart");
      if (response.statusCode == 404) {
        return null;
      }
      // dev.log('Checking the list of products in screen $responseData',
      //     name: "Product_service.dart");
      QuestionModel questionModel = questionModelFromJson(response.body);
      // dev.log(
      //     'Checking for productiteminshopmodels $orders',
      //     name: "Product_service.dart");

      return questionModel;
    } catch (e) {
      rethrow;
    }
  }
}

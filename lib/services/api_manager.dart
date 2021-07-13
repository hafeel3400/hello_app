import 'dart:convert';

import 'package:hello_app/constants/strings.dart';
import 'package:hello_app/models/newsinfo.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;
    try {
      Map<String, String> queryParams = {

        'sources': 'techcrunch',
        'apiKey': 'd003fd29c61a40bcb37d5f5ff4ea8028'
      };

      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = Strings.newsURL + '?' + queryString;
      var response = await client.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {

        var jsonString = response.body;
        print(jsonString);

        newsModel = NewsModel.fromJson(jsonDecode(response.body));
      }
    } catch (Exception) {
      print("exception "+Exception.toString());
      return newsModel;
    }
    return newsModel;
  }
}

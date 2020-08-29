import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/ResponseNews.dart';

String apiKey = '5d81936788dc413ca8d331d14c529e25';

class News {
  Future<ResponseNews> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=$apiKey';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseNews.fromJsonMap(jsonData);
  }
}

class NewsByCategory {
  Future<ResponseNews> getNewsByCategory(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=$apiKey';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseNews.fromJsonMap(jsonData);
  }
}

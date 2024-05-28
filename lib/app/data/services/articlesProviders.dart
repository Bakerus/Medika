import 'dart:convert';

import 'package:medika/app/data/models/articles.dart';
import 'package:http/http.dart' as http;

class ArticlesProviders {
  String urlBase = "http://lameute.alwaysdata.net/article/all";

      List<Articles> parseArticles({required String responseBody}) {
      final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
      return parsed.map<Articles>((json) => Articles.fromJson(json)).toList();
    }


  Future<List<Articles>> get_all_articles() async {
    final response = await http.get(Uri.parse("$urlBase"));

    if (response.statusCode == 200) {
      print(parseArticles(responseBody: response.body));
      return parseArticles(responseBody: response.body);
    }
    else{
      throw Exception('Failed to load articles');
    }
  }
}

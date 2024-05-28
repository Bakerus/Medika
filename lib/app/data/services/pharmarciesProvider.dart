import 'dart:convert';

import 'package:medika/app/data/models/articles.dart';
import 'package:http/http.dart' as http;
import 'package:medika/app/data/models/medicaments.dart';
import 'package:medika/app/data/models/pharmacies.dart';

class PharmaciesProvider {
  String urlBase = "https://lameute.alwaysdata.net/pharmacie/all";

  List<Pharmacies> parseArticles({required String responseBody}) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Pharmacies>((json) => Pharmacies.fromJson(json))
        .toList();
  }

  Future<List<Pharmacies>> get_all_pharmacie() async {
    final response = await http.get(Uri.parse("$urlBase"));

    if (response.statusCode == 200) {
      print(parseArticles(responseBody: response.body));
      return parseArticles(responseBody: response.body);
    } else {
      throw Exception('Failed to load articles');
    }
  }
}

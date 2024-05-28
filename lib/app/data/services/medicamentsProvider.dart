import 'dart:convert';

import 'package:medika/app/data/models/articles.dart';
import 'package:http/http.dart' as http;
import 'package:medika/app/data/models/medicaments.dart';

class MedicamentsProvider {
  String urlBase = "https://lameute.alwaysdata.net/medicament/all";

  List<Medicaments> parseArticles({required String responseBody}) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Medicaments>((json) => Medicaments.fromJson(json))
        .toList();
  }

  Future<List<Medicaments>> get_all_medicaments() async {
    final response = await http.get(Uri.parse("$urlBase"));

    if (response.statusCode == 200) {
      print(parseArticles(responseBody: response.body));
      return parseArticles(responseBody: response.body);
    } else {
      throw Exception('Failed to load articles');
    }
  }
}

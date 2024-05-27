import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../modules/drMeet/Models/doctorModel.dart';

class DoctorProvider extends ChangeNotifier {
  List<Doctor> doctors = [];

  // Getters
  List<Doctor> get doctor => doctors;

  // Fetch doctors from a JSON API
  Future<String> fetchDoctors() async {
    const url =
        'http://lameute.alwaysdata.net/medecin/all'; // Replace with your actual API URL
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      doctors = jsonData.map((data) => Doctor.fromJSON(data)).toList();
      notifyListeners();
      return response.body;
    } else {
      // Handle error scenario (e.g., show an error message)
      throw Exception('Error fetching doctors: ${response.statusCode}');
    }
  }
}

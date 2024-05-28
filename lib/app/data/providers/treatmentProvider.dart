import 'package:flutter/material.dart';
import '../models/treatmentModel.dart';

class TreatmentProvider extends ChangeNotifier {
  List<Treatment> treatments = [
    Treatment(
        title: "Traitement maux de tête",
        doctor: "Dr Habib",
        medcine: "Paracetamol",
        dosage: "2 c/j"),
  ];

  void addToTreatments(
    String title,
    String doctor,
    String medcine,
    String dosage,
  ) {
    treatments.add(Treatment(
        title: title, doctor: doctor, medcine: medcine, dosage: dosage));
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}

class Pharmacies {
  String nom = "";
  String ville = "";
  String quartier = "";
  String description = "";
  String contacts = "";

  Pharmacies(
      {required this.nom,
      required this.contacts,
      required this.description,
      required this.quartier,
      required this.ville});

  Pharmacies.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    ville = json['ville'];
    quartier = json['quartier'];
    description = json['description'];
    contacts = json['contact'];
  }
}

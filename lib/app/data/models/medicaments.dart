class Medicaments {
  String nom ="";
  String grammage =" ";
  String imageUrl = " ";
  String description = "";
  String prix = " ";
  Medicaments({required this.nom, required this.grammage, required this.imageUrl, required this.description, required this.prix});

  Medicaments.fromJson(Map<String, dynamic> json){
    nom = json['nom'] ;
    grammage = json['grammage'];
    imageUrl = json['image'];
    prix = json['prix'] ;
    description = json['description'] ;
  }
}
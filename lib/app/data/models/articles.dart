class Articles {
  String titre = "";
  String auteur = "";
  String image = "";
  String lienArticle = "";
  String date = "";
  String typeArticle ="";

  Articles(
      {required this.titre,
      required this.auteur,
      required this.date,
      required this.image,
      required this.lienArticle,
      required this.typeArticle});

  Articles.fromJson(Map<String, dynamic> json) {
    titre = json['titre'];
    auteur = json['auteur'];
    image = json['image'];
    lienArticle = json['lienArticle'];
    date = json['date'];
    typeArticle = json['typeArticle'];
  }
}

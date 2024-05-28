class Doctor {
  final int id;
  final String name;
  final String specialty;
  final String experience;
  final String location;
  final String about;
  final String imageUrl;

  Doctor(
      {required this.id,
      required this.name,
      required this.specialty,
      required this.experience,
      required this.location,
      required this.about,
      required this.imageUrl});

  factory Doctor.fromJSON(Map<String, dynamic> json) {
    return Doctor(
        id: json['id'] as int,
        name: json['nom'] as String,
        specialty: json['qualification'] as String,
        experience: json['exp'] as String,
        location: json['ville'] as String,
        about: json['about'] as String,
        imageUrl: json['pwd'] as String);
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'nom': name,
      'qualification': specialty,
      'exp': experience,
      'ville': location,
      'about': about,
      'pwd': imageUrl
    };
  }
}

//  "id": 1,
//     "nom": "Kana Wamba",
//     "email": "kanawamba@gmail.com",
//     "pwd": "https://i.goopics.net/ir2pgr.png",
//     "telephone": "+237 564546",
//     "genre": "Femme",
//     "pays": "Cameroun",
//     "ville": "Sangmelima",
//     "qualification": "Nutritioniste",
//     "exp": "5 ans comme nutritioniste",
//     "diplomes": "diplome de nutritioniste, doctorat en medecine",
//     "cni": "45641514651",
//     "about": "Le Dr Kana Wamba est une  nutritionniste agréé et passionné qui\n\naide les individus à adopter une alimentation saine et\n\n équilibrée pour améliorer leur santé",
//     "frais": "100000"
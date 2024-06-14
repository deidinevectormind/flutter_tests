class Company {
  int? id;
  String? createdAt;
  String? nom;
  String? title;

  Company({this.id, this.createdAt, this.nom, this.title});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      createdAt: json['created_at'],
      nom: json['nom'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['nom'] = nom;
    data['title'] = title;
    return data;
  }
}

import 'dart:convert';

class PoliticianSearchModel {
  int id;
  String name;
  String email;
  String politicalParty;
  String uf;
  String photo;

  PoliticianSearchModel({
    required this.id,
    required this.name,
    required this.email,
    required this.politicalParty,
    required this.uf,
    required this.photo,
  });

  PoliticianSearchModel copyWith({
    int? id,
    String? name,
    String? email,
    String? politicalParty,
    String? uf,
    String? photo,
  }) {
    return PoliticianSearchModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      politicalParty: politicalParty ?? this.politicalParty,
      uf: uf ?? this.uf,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'politicalParty': politicalParty,
      'uf': uf,
      'photo': photo,
    };
  }

  factory PoliticianSearchModel.fromMap(Map<String, dynamic> map) {
    return PoliticianSearchModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      politicalParty: map['politicalParty'] ?? '',
      uf: map['uf'] ?? '',
      photo: map['photo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PoliticianSearchModel.fromJson(String source) => PoliticianSearchModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PoliticianSearchModel(id: $id, name: $name, email: $email, politicalParty: $politicalParty, uf: $uf, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PoliticianSearchModel &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.politicalParty == politicalParty &&
      other.uf == uf &&
      other.photo == photo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      politicalParty.hashCode ^
      uf.hashCode ^
      photo.hashCode;
  }
}

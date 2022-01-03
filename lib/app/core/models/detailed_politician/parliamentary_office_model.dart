import 'dart:convert';

class ParliamentaryOfficeModel {
  String name;
  String room;
  String floor;
  String building;
  String phone;
  String email;

  ParliamentaryOfficeModel({
    required this.name,
    required this.room,
    required this.floor,
    required this.building,
    required this.phone,
    required this.email,
  });

  ParliamentaryOfficeModel copyWith({
    String? name,
    String? room,
    String? floor,
    String? building,
    String? phone,
    String? email,
  }) {
    return ParliamentaryOfficeModel(
      name: name ?? this.name,
      room: room ?? this.room,
      floor: floor ?? this.floor,
      building: building ?? this.building,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'room': room,
      'floor': floor,
      'building': building,
      'phone': phone,
      'email': email,
    };
  }

  factory ParliamentaryOfficeModel.fromMap(Map<String, dynamic> map) {
    return ParliamentaryOfficeModel(
      name: map['name'] ?? '',
      room: map['room'] ?? '',
      floor: map['floor'] ?? '',
      building: map['building'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ParliamentaryOfficeModel.fromJson(String source) => ParliamentaryOfficeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ParliamentaryOfficeModel(name: $name, room: $room, floor: $floor, building: $building, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ParliamentaryOfficeModel &&
      other.name == name &&
      other.room == room &&
      other.floor == floor &&
      other.building == building &&
      other.phone == phone &&
      other.email == email;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      room.hashCode ^
      floor.hashCode ^
      building.hashCode ^
      phone.hashCode ^
      email.hashCode;
  }
}

import 'dart:convert';

import 'parliamentary_office_model.dart';

class CandidacyInfoModel {
  String electoralName;
  String politicalParty;
  String electoralCondition;
  String uf;
  DateTime date;
  String status;
  String email;
  ParliamentaryOfficeModel parliamentaryOffice;

  CandidacyInfoModel({
    required this.electoralName,
    required this.politicalParty,
    required this.electoralCondition,
    required this.uf,
    required this.date,
    required this.status,
    required this.email,
    required this.parliamentaryOffice,
  });

  CandidacyInfoModel copyWith({
    String? electoralName,
    String? politicalParty,
    String? electoralCondition,
    String? uf,
    DateTime? date,
    String? status,
    String? email,
    ParliamentaryOfficeModel? parliamentaryOffice,
  }) {
    return CandidacyInfoModel(
      electoralName: electoralName ?? this.electoralName,
      politicalParty: politicalParty ?? this.politicalParty,
      electoralCondition: electoralCondition ?? this.electoralCondition,
      uf: uf ?? this.uf,
      date: date ?? this.date,
      status: status ?? this.status,
      email: email ?? this.email,
      parliamentaryOffice: parliamentaryOffice ?? this.parliamentaryOffice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'electoralName': electoralName,
      'politicalParty': politicalParty,
      'electoralCondition': electoralCondition,
      'uf': uf,
      'date': date.millisecondsSinceEpoch,
      'status': status,
      'email': email,
      'parliamentaryOffice': parliamentaryOffice.toMap(),
    };
  }

  factory CandidacyInfoModel.fromMap(Map<String, dynamic> map) {
    return CandidacyInfoModel(
      electoralName: map['electoralName'] ?? '',
      politicalParty: map['politicalParty'] ?? '',
      electoralCondition: map['electoralCondition'] ?? '',
      uf: map['uf'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      status: map['status'] ?? '',
      email: map['email'] ?? '',
      parliamentaryOffice: ParliamentaryOfficeModel.fromMap(map['parliamentaryOffice']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CandidacyInfoModel.fromJson(String source) => CandidacyInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CandidacyInfoModel(electoralName: $electoralName, politicalParty: $politicalParty, electoralCondition: $electoralCondition, uf: $uf, date: $date, status: $status, email: $email, parliamentaryOffice: $parliamentaryOffice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CandidacyInfoModel &&
      other.electoralName == electoralName &&
      other.politicalParty == politicalParty &&
      other.electoralCondition == electoralCondition &&
      other.uf == uf &&
      other.date == date &&
      other.status == status &&
      other.email == email &&
      other.parliamentaryOffice == parliamentaryOffice;
  }

  @override
  int get hashCode {
    return electoralName.hashCode ^
      politicalParty.hashCode ^
      electoralCondition.hashCode ^
      uf.hashCode ^
      date.hashCode ^
      status.hashCode ^
      email.hashCode ^
      parliamentaryOffice.hashCode;
  }
}

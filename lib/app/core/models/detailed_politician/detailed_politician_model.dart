import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'candidacy_info_model.dart';
import '../../extensions/datetime_extensions.dart';

class DetailedPoliticianModel {
  int id;
  String civilName;
  DateTime birthday;
  String photo;
  List<String> socialMedia;
  String scholarity;
  String birthdayCity;
  String birthdayState;
  CandidacyInfoModel candidacyInfo;

  int get age => birthday.getAge();

  DetailedPoliticianModel({
    required this.id,
    required this.civilName,
    required this.birthday,
    required this.photo,
    required this.socialMedia,
    required this.scholarity,
    required this.birthdayCity,
    required this.birthdayState,
    required this.candidacyInfo,
  });

  DetailedPoliticianModel copyWith({
    int? id,
    String? civilName,
    DateTime? birthday,
    String? photo,
    List<String>? socialMedia,
    String? scholarity,
    String? birthdayCity,
    String? birthdayState,
    CandidacyInfoModel? candidacyInfo,
  }) {
    return DetailedPoliticianModel(
      id: id ?? this.id,
      civilName: civilName ?? this.civilName,
      birthday: birthday ?? this.birthday,
      photo: photo ?? this.photo,
      socialMedia: socialMedia ?? this.socialMedia,
      scholarity: scholarity ?? this.scholarity,
      birthdayCity: birthdayCity ?? this.birthdayCity,
      birthdayState: birthdayState ?? this.birthdayState,
      candidacyInfo: candidacyInfo ?? this.candidacyInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'civilName': civilName,
      'birthday': birthday.millisecondsSinceEpoch,
      'photo': photo,
      'socialMedia': socialMedia,
      'scholarity': scholarity,
      'birthdayCity': birthdayCity,
      'birthdayState': birthdayState,
      'candidacyInfo': candidacyInfo.toMap(),
    };
  }

  factory DetailedPoliticianModel.fromMap(Map<String, dynamic> map) {
    return DetailedPoliticianModel(
      id: map['id']?.toInt() ?? 0,
      civilName: map['civilName'] ?? '',
      birthday: DateTime.fromMillisecondsSinceEpoch(map['birthday']),
      photo: map['photo'] ?? '',
      socialMedia: List<String>.from(map['socialMedia']),
      scholarity: map['scholarity'] ?? '',
      birthdayCity: map['birthdayCity'] ?? '',
      birthdayState: map['birthdayState'] ?? '',
      candidacyInfo: CandidacyInfoModel.fromMap(map['candidacyInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailedPoliticianModel.fromJson(String source) => DetailedPoliticianModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DetailedPoliticianModel(id: $id, civilName: $civilName, birthday: $birthday, photo: $photo, socialMedia: $socialMedia, scholarity: $scholarity, birthdayCity: $birthdayCity, birthdayState: $birthdayState, candidacyInfo: $candidacyInfo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DetailedPoliticianModel &&
      other.id == id &&
      other.civilName == civilName &&
      other.birthday == birthday &&
      other.photo == photo &&
      listEquals(other.socialMedia, socialMedia) &&
      other.scholarity == scholarity &&
      other.birthdayCity == birthdayCity &&
      other.birthdayState == birthdayState &&
      other.candidacyInfo == candidacyInfo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      civilName.hashCode ^
      birthday.hashCode ^
      photo.hashCode ^
      socialMedia.hashCode ^
      scholarity.hashCode ^
      birthdayCity.hashCode ^
      birthdayState.hashCode ^
      candidacyInfo.hashCode;
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PtModel {
  final String nameTitleValue;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;
  final String licenseNumber;
  final String workplaceValue;
  final String birthDayValue;
  final String birthMonthValue;
  final String birthYearValue;
  final String genderStr;
  final String pathAvatar;
  final List<String> tokens;
  PtModel({
    @required this.nameTitleValue,
    @required this.firstName,
    @required this.lastName,
    @required this.phoneNumber,
    @required this.password,
    @required this.licenseNumber,
    @required this.workplaceValue,
    @required this.birthDayValue,
    @required this.birthMonthValue,
    @required this.birthYearValue,
    @required this.genderStr,
    @required this.pathAvatar,
    @required this.tokens,
  });

  PtModel copyWith({
    String nameTitleValue,
    String firstName,
    String lastName,
    String phoneNumber,
    String password,
    String licenseNumber,
    String workplaceValue,
    String birthDayValue,
    String birthMonthValue,
    String birthYearValue,
    String genderStr,
    String pathAvatar,
    List<String> tokens,
  }) {
    return PtModel(
      nameTitleValue: nameTitleValue ?? this.nameTitleValue,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      workplaceValue: workplaceValue ?? this.workplaceValue,
      birthDayValue: birthDayValue ?? this.birthDayValue,
      birthMonthValue: birthMonthValue ?? this.birthMonthValue,
      birthYearValue: birthYearValue ?? this.birthYearValue,
      genderStr: genderStr ?? this.genderStr,
      pathAvatar: pathAvatar ?? this.pathAvatar,
      tokens: tokens ?? this.tokens,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nameTitleValue': nameTitleValue,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'password': password,
      'licenseNumber': licenseNumber,
      'workplaceValue': workplaceValue,
      'birthDayValue': birthDayValue,
      'birthMonthValue': birthMonthValue,
      'birthYearValue': birthYearValue,
      'genderStr': genderStr,
      'pathAvatar': pathAvatar,
      'tokens': tokens,
    };
  }

  factory PtModel.fromMap(Map<String, dynamic> map) {
    return PtModel(
      nameTitleValue: map['nameTitleValue'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
      licenseNumber: map['licenseNumber'],
      workplaceValue: map['workplaceValue'],
      birthDayValue: map['birthDayValue'],
      birthMonthValue: map['birthMonthValue'],
      birthYearValue: map['birthYearValue'],
      genderStr: map['genderStr'],
      pathAvatar: map['pathAvatar'],
      tokens: List<String>.from(map['tokens']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PtModel.fromJson(String source) => PtModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PtModel(nameTitleValue: $nameTitleValue, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, password: $password, licenseNumber: $licenseNumber, workplaceValue: $workplaceValue, birthDayValue: $birthDayValue, birthMonthValue: $birthMonthValue, birthYearValue: $birthYearValue, genderStr: $genderStr, pathAvatar: $pathAvatar, tokens: $tokens)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PtModel &&
      other.nameTitleValue == nameTitleValue &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.phoneNumber == phoneNumber &&
      other.password == password &&
      other.licenseNumber == licenseNumber &&
      other.workplaceValue == workplaceValue &&
      other.birthDayValue == birthDayValue &&
      other.birthMonthValue == birthMonthValue &&
      other.birthYearValue == birthYearValue &&
      other.genderStr == genderStr &&
      other.pathAvatar == pathAvatar &&
      listEquals(other.tokens, tokens);
  }

  @override
  int get hashCode {
    return nameTitleValue.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      phoneNumber.hashCode ^
      password.hashCode ^
      licenseNumber.hashCode ^
      workplaceValue.hashCode ^
      birthDayValue.hashCode ^
      birthMonthValue.hashCode ^
      birthYearValue.hashCode ^
      genderStr.hashCode ^
      pathAvatar.hashCode ^
      tokens.hashCode;
  }
}

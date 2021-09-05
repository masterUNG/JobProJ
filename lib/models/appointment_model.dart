import 'dart:convert';

import 'package:flutter/material.dart';

class AppointmentModel {
  final String appoint;
  final String appointdate;
  final String firstname;
  final String lastname;
  final String pathimage;
  AppointmentModel({
    @required this.appoint,
    @required this.appointdate,
    @required this.firstname,
    @required this.lastname,
    @required this.pathimage,
  });

  AppointmentModel copyWith({
    String appoint,
    String appointdate,
    String firstname,
    String lastname,
    String pathimage,
  }) {
    return AppointmentModel(
      appoint: appoint ?? this.appoint,
      appointdate: appointdate ?? this.appointdate,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      pathimage: pathimage ?? this.pathimage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appoint': appoint,
      'appointdate': appointdate,
      'firstname': firstname,
      'lastname': lastname,
      'pathimage': pathimage,
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      appoint: map['appoint'],
      appointdate: map['appointdate'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      pathimage: map['pathimage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentModel.fromJson(String source) =>
      AppointmentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppointmentModel(appoint: $appoint, appointdate: $appointdate, firstname: $firstname, lastname: $lastname, pathimage: $pathimage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppointmentModel &&
        other.appoint == appoint &&
        other.appointdate == appointdate &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.pathimage == pathimage;
  }

  @override
  int get hashCode {
    return appoint.hashCode ^
        appointdate.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        pathimage.hashCode;
  }
}

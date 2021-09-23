import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CheckExerciseModel {
  final Timestamp exeDate;
  CheckExerciseModel({
    @required this.exeDate,
  });

  CheckExerciseModel copyWith({
    Timestamp exeDate,
  }) {
    return CheckExerciseModel(
      exeDate: exeDate ?? this.exeDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'exeDate': exeDate,
    };
  }

  factory CheckExerciseModel.fromMap(Map<String, dynamic> map) {
    return CheckExerciseModel(
      exeDate: map['exeDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckExerciseModel.fromJson(String source) => CheckExerciseModel.fromMap(json.decode(source));

  @override
  String toString() => 'CheckExerciseModel(exeDate: $exeDate)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CheckExerciseModel &&
      other.exeDate == exeDate;
  }

  @override
  int get hashCode => exeDate.hashCode;
}

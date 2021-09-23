import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ExerciseRequireModel {
  final Timestamp currentDate;
  final Timestamp endDate;
  final List<String> exerciseDocs;
  final List<int> exerciseSets;
  final List<int> exerciseDays;
  final String nameSick;
  final String period;
  final List<Map<String, bool>> result;
  ExerciseRequireModel({
    @required this.currentDate,
    @required this.endDate,
    @required this.exerciseDocs,
    @required this.exerciseSets,
    @required this.exerciseDays,
    @required this.nameSick,
    @required this.period,
    @required this.result,
  });

  ExerciseRequireModel copyWith({
    Timestamp currentDate,
    Timestamp endDate,
    List<String> exerciseDocs,
    List<int> exerciseSets,
    List<int> exerciseDays,
    String nameSick,
    String period,
    List<Map<String, bool>> result,
  }) {
    return ExerciseRequireModel(
      currentDate: currentDate ?? this.currentDate,
      endDate: endDate ?? this.endDate,
      exerciseDocs: exerciseDocs ?? this.exerciseDocs,
      exerciseSets: exerciseSets ?? this.exerciseSets,
      exerciseDays: exerciseDays ?? this.exerciseDays,
      nameSick: nameSick ?? this.nameSick,
      period: period ?? this.period,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currentDate': currentDate,
      'endDate': endDate,
      'exerciseDocs': exerciseDocs,
      'exerciseSets': exerciseSets,
      'exerciseDays': exerciseDays,
      'nameSick': nameSick,
      'period': period,
      'result': result,
    };
  }

  factory ExerciseRequireModel.fromMap(Map<String, dynamic> map) {
    return ExerciseRequireModel(
      currentDate: map['currentDate'],
      endDate: map['endDate'],
      exerciseDocs: List<String>.from(map['exerciseDocs']),
      exerciseSets: List<int>.from(map['exerciseSets']),
      exerciseDays: List<int>.from(map['exerciseDays']),
      nameSick: map['nameSick'],
      period: map['period'],
      result: List<Map<String, bool>>.from(map['result']?.map((x) => x)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseRequireModel.fromJson(String source) => ExerciseRequireModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExerciseRequireModel(currentDate: $currentDate, endDate: $endDate, exerciseDocs: $exerciseDocs, exerciseSets: $exerciseSets, exerciseDays: $exerciseDays, nameSick: $nameSick, period: $period, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ExerciseRequireModel &&
      other.currentDate == currentDate &&
      other.endDate == endDate &&
      listEquals(other.exerciseDocs, exerciseDocs) &&
      listEquals(other.exerciseSets, exerciseSets) &&
      listEquals(other.exerciseDays, exerciseDays) &&
      other.nameSick == nameSick &&
      other.period == period &&
      listEquals(other.result, result);
  }

  @override
  int get hashCode {
    return currentDate.hashCode ^
      endDate.hashCode ^
      exerciseDocs.hashCode ^
      exerciseSets.hashCode ^
      exerciseDays.hashCode ^
      nameSick.hashCode ^
      period.hashCode ^
      result.hashCode;
  }
}

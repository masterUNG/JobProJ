import 'dart:convert';
import 'package:flutter/material.dart';

class ExerciseModel {
  final String name;
  final String detail;
  final String image;
  ExerciseModel({
    @required this.name,
    @required this.detail,
    @required this.image,
  });

  ExerciseModel copyWith({
    String name,
    String detail,
    String image,
  }) {
    return ExerciseModel(
      name: name ?? this.name,
      detail: detail ?? this.detail,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'detail': detail,
      'image': image,
    };
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      name: map['name'],
      detail: map['detail'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseModel.fromJson(String source) => ExerciseModel.fromMap(json.decode(source));

  @override
  String toString() => 'ExerciseModel(name: $name, detail: $detail, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ExerciseModel &&
      other.name == name &&
      other.detail == detail &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ detail.hashCode ^ image.hashCode;
}

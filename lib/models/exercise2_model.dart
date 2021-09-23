import 'dart:convert';

import 'package:flutter/material.dart';

class Exercise2Model {
  final int index;
  final int times;
  final int sets;
  Exercise2Model({
    @required this.index,
    @required this.times,
    @required this.sets,
  });

  Exercise2Model copyWith({
    int index,
    int times,
    int sets,
  }) {
    return Exercise2Model(
      index: index ?? this.index,
      times: times ?? this.times,
      sets: sets ?? this.sets,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'times': times,
      'sets': sets,
    };
  }

  factory Exercise2Model.fromMap(Map<String, dynamic> map) {
    return Exercise2Model(
      index: map['index'],
      times: map['times'],
      sets: map['sets'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Exercise2Model.fromJson(String source) => Exercise2Model.fromMap(json.decode(source));

  @override
  String toString() => 'Exercise2Model(index: $index, times: $times, sets: $sets)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Exercise2Model &&
      other.index == index &&
      other.times == times &&
      other.sets == sets;
  }

  @override
  int get hashCode => index.hashCode ^ times.hashCode ^ sets.hashCode;
}

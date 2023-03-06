import 'package:equatable/equatable.dart';

import 'dart:convert';

class CounterState extends Equatable {
  int initialValue;
  bool wasIncremented;

  CounterState({required this.initialValue, required this.wasIncremented});

  @override
  List<Object?> get props => [initialValue, wasIncremented];

  factory CounterState.fromJson(Map<String, dynamic> json) {
    return CounterState(
      initialValue: json['initialValue'] as int,
      wasIncremented: json['wasIncremented'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'initialValue': initialValue,
      'wasIncremented': wasIncremented,
    };
  }

  String toJsonString() => json.encode(toJson());
}

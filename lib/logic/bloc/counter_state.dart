import 'package:equatable/equatable.dart';

import 'dart:convert';

class CounterBlocState extends Equatable {
  final int counter;
  final bool wasIncremented;

  const CounterBlocState({required this.wasIncremented,required this.counter});

  factory CounterBlocState.initial() {
    return  CounterBlocState(wasIncremented: false, counter: 0);
  }

  Map<String, dynamic> toMap() {
    return {
      'counter': counter,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterBlocState.fromMap(Map<String, dynamic> map) {
    return CounterBlocState(
      counter: map['counter'], wasIncremented:  map['wasIncremented'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterBlocState.fromJson(String source) =>
      CounterBlocState.fromMap(json.decode(source));

  CounterBlocState copyWith({
    int? counter,
    bool? wasIncremented,
  }) {
    return CounterBlocState(
      counter: counter ?? this.counter,
      wasIncremented: wasIncremented ?? this.wasIncremented,
    );
  }

  @override
  List<Object?> get props => [counter,wasIncremented];
}







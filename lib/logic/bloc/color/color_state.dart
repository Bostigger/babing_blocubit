import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ColorState extends Equatable{
  final Color color;
  const ColorState({required this.color});

  @override
  List<Object?> get props =>[color];

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'ColorState { color: $color }';
  }

  factory ColorState.initial() {
    return ColorState(color: Colors.lightBlue);
  }
}



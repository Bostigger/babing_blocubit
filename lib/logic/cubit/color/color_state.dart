import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

class ColorState extends Equatable {
  final Color colorState;

  ColorState({required this.colorState});

  @override
  List<Object?> get props => [colorState];

  ColorState copyWith({Color? colorState}) {
    return ColorState(
      colorState: colorState ?? this.colorState,
    );
  }

  @override
  String toString() => 'ColorState(colorState: $colorState)';

  factory ColorState.initial(){
    return ColorState(colorState: Colors.red);
  }
}

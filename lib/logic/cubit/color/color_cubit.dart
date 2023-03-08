import 'package:babing_cubit/logic/cubit/color/color_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ColorCubit extends Cubit<ColorState>{
  ColorCubit():super(ColorState.initial());

  void changeColors() {
    if (state.colorState == Colors.red) {
      emit(state.copyWith(colorState: Colors.cyan));
    } else if ((state.colorState == Colors.cyan)) {
      emit(state.copyWith(colorState: Colors.lightGreen));
    } else if ((state.colorState == Colors.lightGreen)) {
      emit(state.copyWith(colorState: Colors.red));
    }
  }

}
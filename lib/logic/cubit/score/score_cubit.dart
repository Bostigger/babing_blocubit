import 'dart:async';

import 'package:babing_cubit/logic/cubit/color/color_state.dart';
import 'package:babing_cubit/logic/cubit/score/score_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../color/color_cubit.dart';

class ScoreCubit extends Cubit<ScoreState>{
  int increment=1;
  late final StreamSubscription colorCubitSubscription;
  final ColorCubit colorCubit;
  ScoreCubit({ required this.colorCubit}):super(ScoreState.initial()){
    colorCubitSubscription = colorCubit.stream.listen((ColorState color) {
      if(color.colorState==Colors.red){
        increment=10;
      }else if(color.colorState==Colors.cyan){
        increment=100;
      }else if(color.colorState==Colors.lightGreen) {
        increment = -20;
      }
    });
  }
  void changeScore(){
    emit(state.copyWith(scoreIncrement: state.scoreIncrement+increment));
  }

  @override
  Future<void> close() {
    colorCubitSubscription.cancel();
    return super.close();
  }

}
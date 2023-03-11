import 'dart:async';

import 'package:babing_cubit/logic/bloc/color/color_state.dart';
import 'package:babing_cubit/logic/bloc/score/score_event.dart';
import 'package:babing_cubit/logic/bloc/score/score_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../color/color_bloc.dart';

class ScoreBloc extends Bloc<ScoreEvent,ScoreState>{
  int incrementSize = 0;
  final ColorBloc colorBloc;
  late final StreamSubscription colorStreamSubscription;

  ScoreBloc({required this.colorBloc}):super(ScoreState.initial()){
    colorStreamSubscription = colorBloc.stream.listen((ColorState cs) {
      if(cs.color==Colors.lightBlue){
        incrementSize = 100;
      }else if(cs.color==Colors.deepOrange){
        incrementSize = 200;
      }else if(cs.color==Colors.yellowAccent){
        incrementSize = -50;
      }
    });
    on<ChangeScoreEvent>((event,emit){
      emit(state.copyWith(scoreCount:state.scoreCount+incrementSize));
    });
  }

  @override
  Future<void> close() {
    colorStreamSubscription.cancel();
    return super.close();
  }

}
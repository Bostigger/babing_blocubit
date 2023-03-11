import 'package:babing_cubit/logic/bloc/color/color_event.dart';
import 'package:babing_cubit/logic/bloc/color/color_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ColorBloc extends Bloc<ColorEvent,ColorState>{
  ColorBloc():super(ColorState.initial()){
    on<ChangeColorEvent>((event,emit){
      if(state.color==Colors.lightBlue){
        emit(state.copyWith(color:Colors.yellowAccent));
      }else if(state.color==Colors.yellowAccent){
        emit(state.copyWith(color: Colors.deepOrange));
      }else if(state.color==Colors.deepOrange){
        emit(state.copyWith(color: Colors.lightBlue));
      }
    });
  }

}
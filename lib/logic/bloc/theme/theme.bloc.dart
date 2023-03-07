

import 'package:babing_cubit/logic/bloc/theme/theme.event.dart';
import 'package:babing_cubit/logic/bloc/theme/theme.state.dart';
import 'package:bloc/bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent,ThemeBlocState> {
  ThemeBloc() :super(ThemeBlocState.initial()) {
    on<ChangeThemeEvent>((event, emit) {
      print(event.nextVal);
      print(state.appThemeState);
       if(event.nextVal %2 ==0){
         emit(state.copyWith(appThemeState: ThemeStates.dark));
       }else{
         emit(state.copyWith(appThemeState: ThemeStates.light));
       }
    });
  }
}
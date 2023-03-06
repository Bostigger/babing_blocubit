
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'bloc_cubit_state.dart';

class CounterCubit extends HydratedCubit<CounterState>{
  CounterCubit():super(CounterState(initialValue: 0,wasIncremented: false));
  
  void incrementCounter(){
    emit(CounterState(initialValue: state.initialValue+1, wasIncremented: true));

  }
  void decrementCounter(){
    emit(CounterState(initialValue: state.initialValue-1,wasIncremented: false));

  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return CounterState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    // TODO: implement toJson
    return state.toJson();

  }


}
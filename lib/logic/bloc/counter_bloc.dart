import 'package:babing_cubit/logic/bloc/counter.event.dart';
import 'package:babing_cubit/logic/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterBlocState> {
  CounterBloc() : super(CounterBlocState.initial()) {
    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1,wasIncremented: true));
     });
    on<DecrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1,wasIncremented: false));

    });
  }

  @override
  CounterBlocState? fromJson(Map<String, dynamic> json) {
    return CounterBlocState.fromMap(json);

  }

  @override
  Map<String, dynamic>? toJson(CounterBlocState state) {
    return state.toMap();

  }
}
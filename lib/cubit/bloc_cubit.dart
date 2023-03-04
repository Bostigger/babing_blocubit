import 'package:babing_cubit/cubit/bloc_cubit_state.dart';
import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit():super(CounterState(initialValue: 0,wasIncremented: false));
  
  void incrementCounter(){
    emit(CounterState(initialValue: state.initialValue+1, wasIncremented: true));
    print(state.initialValue);
  }
  void decrementCounter(){
    emit(CounterState(initialValue: state.initialValue-1,wasIncremented: false));
    print(state.initialValue);
  }
}
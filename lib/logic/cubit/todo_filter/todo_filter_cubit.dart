import 'package:babing_cubit/data/models/todo_model.dart';
import 'package:babing_cubit/logic/cubit/todo_filter/todo_filter_state.dart';
import 'package:bloc/bloc.dart';

class TodoFilterCubit extends Cubit<TodoFilterState>{
  TodoFilterCubit():super(TodoFilterState.initial());

  void changeFilter(Filter newFilter){
    emit(state.copyWith(filter: newFilter));
  }
}
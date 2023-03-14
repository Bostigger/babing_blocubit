import 'dart:async';

import 'package:babing_cubit/logic/cubit/todo_count/active_todo_count_state.dart';
import 'package:babing_cubit/logic/cubit/todos/todo_list_cubit.dart';
import 'package:bloc/bloc.dart';

import '../../../data/models/todo_model.dart';
import '../todos/todo_list_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState>{
  final TodoListCubit todoListCubit;
  int totalActiveTodos =0;
  late final StreamSubscription todoListSubscription;
  ActiveTodoCountCubit(this.todoListCubit):super(ActiveTodoCountState.initial()){
    todoListSubscription = todoListCubit.stream.listen((TodoListState todoListState) {
      totalActiveTodos = todoListState.myTodos.where((Todo t) => !t.completed).toList().length; });
  }
  void getTotalActiveTodos(){
    emit(state.copyWith(myTotalActiveTodos: totalActiveTodos));
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
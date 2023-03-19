import 'dart:async';

import 'package:babing_cubit/logic/bloc/todo/todo_count/active_todo_count_event.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_count/active_todo_count_state.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_list/todo_list_bloc.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_list/todo_list_state.dart';
import 'package:bloc/bloc.dart';

import '../../../../data/models/todo_model.dart';

class ActiveTodoCountBloc extends Bloc<ActiveTodoCountBlocEvent,ActiveTodoCountBlocState>{
  final TodoListBloc todoListBloc;
  final int totalActiveItems;
  int totalActiveTodos =0;
  late final StreamSubscription todoListSubscription;
  ActiveTodoCountBloc({required this.totalActiveItems, required this.todoListBloc}):super(ActiveTodoCountBlocState(myTotalActiveTodos: totalActiveItems)){
   todoListSubscription = todoListBloc.stream.listen((TodoListBlocState ts) {
     totalActiveTodos = ts.myTodos.where((Todo t) => !t.completed).toList().length;
   });
   on<GetTotalActiveTodosEvent>((event,emit){
     emit(state.copyWith(myTotalActiveTodos: totalActiveTodos));
   });
  }


}
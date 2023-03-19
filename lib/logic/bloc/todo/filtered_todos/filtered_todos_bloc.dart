import 'dart:async';

import 'package:babing_cubit/logic/bloc/todo/filtered_todos/filtered_todos_event.dart';
import 'package:babing_cubit/logic/bloc/todo/filtered_todos/filtered_todos_state.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_filters/todo_filter_bloc.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_filters/todo_filter_state.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_list/todo_list_bloc.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_list/todo_list_state.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_search/todo_search_bloc.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_search/todo_search_state.dart';
import 'package:bloc/bloc.dart';

import '../../../../data/models/todo_model.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosBlocEvent,FilteredTodosBlocState>{

  final TodoListBloc todosListBloc;
  final TodoSearchBloc todoSearchBloc;
  final TodoFilterBloc todoFilterBloc;
  final List<Todo>initialFilteredTodos;

  late final StreamSubscription todoListSubscription;
  late  final StreamSubscription searchKeywordSubscription;
  late  final StreamSubscription filterSubscription;
  FilteredTodosBloc({required this.todosListBloc,required this.todoSearchBloc,required this.todoFilterBloc,required this.initialFilteredTodos}):super(FilteredTodosBlocState(filteredTodos: initialFilteredTodos)){
    searchKeywordSubscription = todoSearchBloc.stream.listen((TodoSearchBlocState todoSearchState) {
      getFilteredTodos();
    });
    todoListSubscription = todosListBloc.stream.listen((TodoListBlocState todoListState) {
      getFilteredTodos();
    });
    filterSubscription = todoFilterBloc.stream.listen((TodoFilterBlocState todoFilterState) {
      getFilteredTodos();
    });
    on<GetFilteredTodosEvent>((event,emit){
      emit(state.copyWith(filteredTodos: event.filteredTodos));
    });
  }

  void getFilteredTodos(){
    List<Todo> filteredTodos;

    switch(todoFilterBloc.state.filter){

      case Filter.all:
        filteredTodos = todosListBloc.state.myTodos;
        break;
      case Filter.active:
        filteredTodos = todosListBloc.state.myTodos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        filteredTodos = todosListBloc.state.myTodos.where((Todo todo) => todo.completed).toList();
        break;
    }
    emit(state.copyWith(filteredTodos: filteredTodos));
    if(todoSearchBloc.state.searchItem.isNotEmpty){
      filteredTodos = filteredTodos.where((Todo todo) => todo.description.toLowerCase().contains(todoSearchBloc.state.searchItem)).toList();
    }


    add(GetFilteredTodosEvent(filteredTodos: filteredTodos));
  }


  Future<void> close() {
    searchKeywordSubscription.cancel();
    todoListSubscription.cancel();
    filterSubscription.cancel();
    return super.close();
  }

}
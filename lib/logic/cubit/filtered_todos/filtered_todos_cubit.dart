import 'dart:async';

import 'package:babing_cubit/logic/cubit/filtered_todos/filtered_todos_state.dart';
import 'package:babing_cubit/logic/cubit/todo_filter/todo_filter_cubit.dart';
import 'package:babing_cubit/logic/cubit/todo_filter/todo_filter_state.dart';
import 'package:babing_cubit/logic/cubit/todo_search/todo_search_state.dart';
import 'package:babing_cubit/logic/cubit/todos/todo_list_state.dart';
import 'package:bloc/bloc.dart';

import '../../../data/models/todo_model.dart';
import '../todo_search/todo_search_cubit.dart';
import '../todos/todo_list_cubit.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState>{

  final TodoListCubit todosListCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoFilterCubit todoFilterCubit;
  late final StreamSubscription todoListSubscription;
  late  final StreamSubscription searchKeywordSubscription;
  late  final StreamSubscription filterSubscription;
  FilteredTodosCubit(this.todosListCubit, this.todoSearchCubit, this.todoFilterCubit):super(FilteredTodosState.initial()){
    searchKeywordSubscription = todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {});
    todoListSubscription = todosListCubit.stream.listen((TodoListState todoListState) {});
    filterSubscription = todoFilterCubit.stream.listen((TodoFilterState todoFilterState) { });
  }

  void getFilteredTodos(){
    List<Todo> _filteredTodos;

    switch(todoFilterCubit.state.filter){

      case Filter.all:
       _filteredTodos = todosListCubit.state.myTodos;
        break;
      case Filter.active:
        _filteredTodos = todosListCubit.state.myTodos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        _filteredTodos = todosListCubit.state.myTodos.where((Todo todo) => todo.completed).toList();
        break;
    }

    if(todoSearchCubit.state.searchItem.isNotEmpty){
      _filteredTodos = _filteredTodos.where((Todo todo) => todo.description.toLowerCase().contains(todoSearchCubit.state.searchItem)).toList();
    }
    emit(state.copyWith(filteredTodos: _filteredTodos));
  }


  Future<void> close() {
    searchKeywordSubscription.cancel();
    todoListSubscription.cancel();
    filterSubscription.cancel();
    return super.close();
  }

}
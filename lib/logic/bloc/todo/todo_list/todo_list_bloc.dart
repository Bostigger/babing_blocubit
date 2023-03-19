import 'package:babing_cubit/logic/bloc/todo/todo_list/todo_list_event.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_list/todo_list_state.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../data/models/todo_model.dart';

class TodoListBloc extends HydratedBloc<TodoListBlocEvent,TodoListBlocState>{
  TodoListBloc():super(TodoListBlocState.initial()){
    on<AddTodoEvent>((event,emit){
      final newTodoItem = Todo(description: event.description);
      final updatedTodoList = [...state.myTodos,newTodoItem];
      emit(state.copyWith(myTodos: updatedTodoList));
    });
    on<EditTodoEvent>((event,emit){
      final todoListItems = state.myTodos.map((Todo todo){
        if(todo.id==event.id){
          return Todo( id: todo.id, description: event.description, completed: todo.completed);
        }
        return todo;
      }).toList();
      emit(state.copyWith(myTodos: todoListItems));
    });
    on<RemoveTodoEvent>((event,emit){
      final updatedTodoList = state.myTodos.where((Todo t) => t.id != event.todo.id).toList();
      emit(state.copyWith(myTodos: updatedTodoList));
    });

    on<ToggleTodoCompletionEvent>((event,emit){
      final todoListItems = state.myTodos.map((Todo todo){
        if(todo.id==event.id){
          return Todo( id: todo.id, description: todo.description, completed: !todo.completed);
        }
        return todo;
      }).toList();
      emit(state.copyWith(myTodos: todoListItems));
    });
  }

  @override
  TodoListBlocState? fromJson(Map<String, dynamic> json) {
    return TodoListBlocState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoListBlocState state) {
    return state.toJson();
  }
}
import 'package:babing_cubit/data/models/todo_model.dart';
import 'package:babing_cubit/logic/cubit/todos/todo_list_state.dart';
import 'package:bloc/bloc.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit():super(TodoListState.initial());

  void addTodo(String description){
    final newTodoItem = Todo(description: description);
    final updatedTodoList = [...state.myTodos,newTodoItem];
    emit(state.copyWith(myTodos: updatedTodoList));

  }

  void editTodo(String id, String newDescription){
    final todoListItems = state.myTodos.map((Todo todo){
      if(todo.id==id){
        return Todo( id: todo.id, description: newDescription, completed: todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(myTodos: todoListItems));
  }
  void toggleCompletion(String id){
    final todoListItems = state.myTodos.map((Todo todo){
      if(todo.id==id){
        return Todo( id: todo.id, description: todo.description, completed: !todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(myTodos: todoListItems));
  }

  void removeTodoItem(Todo todo){
    final updatedTodoList = state.myTodos.where((Todo t) => t.id != todo.id).toList();
    emit(state.copyWith(myTodos: updatedTodoList));
  }


}
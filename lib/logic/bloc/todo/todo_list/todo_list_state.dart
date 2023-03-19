import 'package:babing_cubit/data/models/todo_model.dart';
import 'package:equatable/equatable.dart';

class TodoListBlocState extends Equatable {
  final List<Todo> myTodos;

  const TodoListBlocState({required this.myTodos});

  factory TodoListBlocState.initial() {
    return TodoListBlocState(
      myTodos: [
        Todo(id: '1', description: 'Learn Bloc'),
        Todo(id: '2', description: 'Go Home'),
        Todo(id: '3', description: 'Create a package'),
      ],
    );
  }

  @override
  List<Object?> get props => [myTodos];

  TodoListBlocState copyWith({List<Todo>? myTodos}) {
    return TodoListBlocState(myTodos: myTodos ?? this.myTodos);
  }

  @override
  String toString() {
    return 'TodoListBlocState(myTodos: $myTodos)';
  }

  Map<String, dynamic> toJson() {
    return {
      'myTodos': myTodos.map((todo) => todo.toJson()).toList(),
    };
  }

  factory TodoListBlocState.fromJson(Map<String, dynamic> json) {
    final todos = (json['myTodos'] as List)
        .map((todoJson) => Todo.fromJson(todoJson))
        .toList();
    return TodoListBlocState(myTodos: todos);
  }
}

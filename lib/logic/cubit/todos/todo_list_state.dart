import 'package:babing_cubit/data/models/todo_model.dart';
import 'package:equatable/equatable.dart';

class TodoListState extends Equatable {
  final List<Todo> myTodos;

  const TodoListState({required this.myTodos});

  factory TodoListState.initial() {
    return  TodoListState(myTodos: [
      Todo(id: '1',description: 'Learn Bloc'),
      Todo(id: '2',description: 'Go Home'),
      Todo(id: '3',description: 'Create a package'),
    ]);
  }

  @override
  List<Object?> get props => [myTodos];

  TodoListState copyWith({List<Todo>? myTodos}) {
    return TodoListState(myTodos: myTodos ?? this.myTodos);
  }

  @override
  String toString() {
    return 'TodoListState(myTodos: $myTodos)';
  }

  Map<String, dynamic> toJson() {
    return {
      'myTodos': this.myTodos,
    };
  }

  factory TodoListState.fromMap(Map<String, dynamic> json) {
    return TodoListState(
      myTodos: json['myTodos'] as List<Todo>,
    );
  }
}

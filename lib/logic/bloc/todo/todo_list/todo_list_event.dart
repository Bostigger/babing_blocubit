import 'package:equatable/equatable.dart';

import '../../../../data/models/todo_model.dart';

 abstract class TodoListBlocEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

class AddTodoEvent extends TodoListBlocEvent{
   final String description;
   AddTodoEvent({required this.description});
}
class EditTodoEvent extends TodoListBlocEvent{
  final String description;
  final String id;
  EditTodoEvent( {required this.id,required this.description});
}

class RemoveTodoEvent extends TodoListBlocEvent{
  final Todo todo;
  RemoveTodoEvent({required this.todo});
}
class ToggleTodoCompletionEvent extends TodoListBlocEvent{
  final String id;
  ToggleTodoCompletionEvent({required this.id});
}
import 'package:equatable/equatable.dart';

import '../../../../data/models/todo_model.dart';

abstract class FilteredTodosBlocEvent extends Equatable{
  const FilteredTodosBlocEvent();
}
class GetFilteredTodosEvent extends FilteredTodosBlocEvent{
  final  List<Todo> filteredTodos;
  GetFilteredTodosEvent({required this.filteredTodos});

  @override
  String toString() {
    return 'GetFilteredTodosEvent{filteredTodos: $filteredTodos}';
  }

  @override
  // TODO: implement props
  List<Object?> get props =>[filteredTodos];
}
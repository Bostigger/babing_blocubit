import 'package:equatable/equatable.dart';

import '../../../../data/models/todo_model.dart';


class FilteredTodosBlocState extends Equatable {
  final List<Todo> filteredTodos;

  FilteredTodosBlocState({required this.filteredTodos});

  @override
  List<Object?> get props => [filteredTodos];

  FilteredTodosBlocState copyWith({List<Todo>? filteredTodos}) {
    return FilteredTodosBlocState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }

  @override
  String toString() => 'FilteredTodosState(filteredTodos: $filteredTodos)';

  static FilteredTodosBlocState initial() {
    return FilteredTodosBlocState(filteredTodos: []);
  }
}

import 'package:equatable/equatable.dart';

import '../../../data/models/todo_model.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filteredTodos;

  FilteredTodosState({required this.filteredTodos});

  @override
  List<Object?> get props => [filteredTodos];

  FilteredTodosState copyWith({List<Todo>? filteredTodos}) {
    return FilteredTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }

  @override
  String toString() => 'FilteredTodosState(filteredTodos: $filteredTodos)';

  static FilteredTodosState initial() {
    return FilteredTodosState(filteredTodos: []);
  }
}

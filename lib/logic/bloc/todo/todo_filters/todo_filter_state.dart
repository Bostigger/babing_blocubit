import 'package:babing_cubit/data/models/todo_model.dart';
import 'package:equatable/equatable.dart';

class TodoFilterBlocState extends Equatable{
  final Filter filter;
  const TodoFilterBlocState({required this.filter});


  @override
  // TODO: implement props
  List<Object?> get props => [filter];

  factory TodoFilterBlocState.initial(){
    return const TodoFilterBlocState(filter: Filter.all);
  }

  TodoFilterBlocState copyWith({
    Filter? filter,
  }) {
    return TodoFilterBlocState(
      filter: filter ?? this.filter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filter': filter,
    };
  }

  factory TodoFilterBlocState.fromMap(Map<String, dynamic> map) {
    return TodoFilterBlocState(
      filter: map['filter'] as Filter,
    );
  }

  @override
  String toString() {
    return 'TodoFilterState{filter: $filter}';
  }
}
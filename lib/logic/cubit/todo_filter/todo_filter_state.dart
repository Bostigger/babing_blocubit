import 'package:babing_cubit/data/models/todo_model.dart';
import 'package:equatable/equatable.dart';

class TodoFilterState extends Equatable{
 final Filter filter;
 const TodoFilterState({required this.filter});
 
 
  @override
  // TODO: implement props
  List<Object?> get props => [filter];

  factory TodoFilterState.initial(){
    return const TodoFilterState(filter: Filter.all);
  }

 TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }

 Map<String, dynamic> toMap() {
    return {
      'filter': filter,
    };
  }

  factory TodoFilterState.fromMap(Map<String, dynamic> map) {
    return TodoFilterState(
      filter: map['filter'] as Filter,
    );
  }

 @override
  String toString() {
    return 'TodoFilterState{filter: $filter}';
  }
}
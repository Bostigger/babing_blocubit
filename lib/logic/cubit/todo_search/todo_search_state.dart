import 'package:equatable/equatable.dart';

class TodoSearchState extends Equatable {
  final String searchItem;

  const TodoSearchState({required this.searchItem});

  factory TodoSearchState.initial() {
    return const TodoSearchState(searchItem: '');
  }

  @override
  List<Object?> get props => [searchItem];

  TodoSearchState copyWith({String? searchItem}) {
    return TodoSearchState(searchItem: searchItem ?? this.searchItem);
  }

  @override
  String toString() {
    return 'TodoSearchState(searchItem: $searchItem)';
  }
}

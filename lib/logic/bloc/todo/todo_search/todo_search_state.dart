import 'package:equatable/equatable.dart';

class TodoSearchBlocState extends Equatable {
  final String searchItem;

  const TodoSearchBlocState({required this.searchItem});

  factory TodoSearchBlocState.initial() {
    return const TodoSearchBlocState(searchItem: '');
  }

  @override
  List<Object?> get props => [searchItem];

  TodoSearchBlocState copyWith({String? searchItem}) {
    return TodoSearchBlocState(searchItem: searchItem ?? this.searchItem);
  }

  @override
  String toString() {
    return 'TodoSearchState(searchItem: $searchItem)';
  }
}

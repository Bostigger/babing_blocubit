import 'package:equatable/equatable.dart';

abstract class TodoSearchBlocEvent extends Equatable{
  const TodoSearchBlocEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SetSearchWordEvent extends TodoSearchBlocEvent{
  final String searchKeyword;
  SetSearchWordEvent({required this.searchKeyword});
}
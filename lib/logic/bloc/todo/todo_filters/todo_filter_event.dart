import 'package:equatable/equatable.dart';

import '../../../../data/models/todo_model.dart';

abstract class TodoFilterBlocEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ChangeTodoFilterEvent extends TodoFilterBlocEvent{
  final Filter filter;
  ChangeTodoFilterEvent({required this.filter});
}
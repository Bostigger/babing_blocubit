import 'package:equatable/equatable.dart';

abstract class ActiveTodoCountBlocEvent extends Equatable{
  const ActiveTodoCountBlocEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class GetTotalActiveTodosEvent extends ActiveTodoCountBlocEvent{}
import 'package:equatable/equatable.dart';

class ActiveTodoCountState extends Equatable{
  final int myTotalActiveTodos;
  const ActiveTodoCountState({required this.myTotalActiveTodos});

  ActiveTodoCountState copyWith({
    int? myTotalActiveTodos,
  }) {
    return ActiveTodoCountState(
      myTotalActiveTodos: myTotalActiveTodos ?? this.myTotalActiveTodos,
    );
  }


  factory ActiveTodoCountState.initial(){
    return  const ActiveTodoCountState(myTotalActiveTodos: 0);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [myTotalActiveTodos];

  @override
  String toString() {
    return 'ActiveTodoCountState{myTotalActiveTodos: $myTotalActiveTodos}';
  }
}
import 'package:equatable/equatable.dart';

class ActiveTodoCountBlocState extends Equatable{
  final int myTotalActiveTodos;
  const ActiveTodoCountBlocState({required this.myTotalActiveTodos});

  ActiveTodoCountBlocState copyWith({
    int? myTotalActiveTodos,
  }) {
    return ActiveTodoCountBlocState(
      myTotalActiveTodos: myTotalActiveTodos ?? this.myTotalActiveTodos,
    );
  }


  factory ActiveTodoCountBlocState.initial(){
    return  const ActiveTodoCountBlocState(myTotalActiveTodos: 0);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [myTotalActiveTodos];

  @override
  String toString() {
    return 'ActiveTodoCountState{myTotalActiveTodos: $myTotalActiveTodos}';
  }
}
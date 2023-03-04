import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
  int initialValue;
  bool wasIncremented;
  CounterState({required this.initialValue, required this.wasIncremented});

  @override
  // TODO: implement props
  List<Object?> get props => [initialValue,wasIncremented];
}
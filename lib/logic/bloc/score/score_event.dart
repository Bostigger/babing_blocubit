 import 'package:equatable/equatable.dart';

 abstract class ScoreEvent extends Equatable{
  const ScoreEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeScoreEvent extends ScoreEvent{
 int incrementSize;
 ChangeScoreEvent({required this.incrementSize});

}
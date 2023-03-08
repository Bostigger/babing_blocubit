import 'package:equatable/equatable.dart';

class ScoreState extends Equatable {
  final int scoreIncrement;

  ScoreState({required this.scoreIncrement});

  @override
  List<Object?> get props => [scoreIncrement];

  ScoreState copyWith({int? scoreIncrement}) {
    return ScoreState(
      scoreIncrement: scoreIncrement ?? this.scoreIncrement,
    );
  }

  factory ScoreState.initial(){
    return ScoreState(scoreIncrement: 0);
  }

  @override
  String toString() => 'ScoreState(scoreIncrement: $scoreIncrement)';
}

import 'package:equatable/equatable.dart';

class ScoreState extends Equatable{
  final int scoreCount;

  ScoreState({required this.scoreCount});

  @override
  List<Object?> get props => [scoreCount];

  ScoreState copyWith({
    int? scoreCount,
  }) {
    return ScoreState(
      scoreCount: scoreCount ?? this.scoreCount,
    );
  }

  @override
  String toString() {
    return 'ScoreState { scoreCount: $scoreCount }';
  }

  factory ScoreState.initial() {
    return ScoreState(scoreCount: 0);
  }
}

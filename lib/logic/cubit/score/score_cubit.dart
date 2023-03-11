
import 'package:babing_cubit/logic/cubit/score/score_state.dart';
import 'package:bloc/bloc.dart';


class ScoreCubit extends Cubit<ScoreState>{


  ScoreCubit():super(ScoreState.initial());

  void changeScore(int increment){
    emit(state.copyWith(scoreIncrement: state.scoreIncrement+increment));
  }


}

import 'package:babing_cubit/logic/bloc/score/score_event.dart';
import 'package:babing_cubit/logic/bloc/score/score_state.dart';
import 'package:bloc/bloc.dart';

class ScoreBloc extends Bloc<ScoreEvent,ScoreState>{

  ScoreBloc():super(ScoreState.initial()){
    on<ChangeScoreEvent>((event,emit){
      emit(state.copyWith(scoreCount:state.scoreCount+event.incrementSize));
    });
  }


}
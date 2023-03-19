import 'package:babing_cubit/logic/bloc/todo/todo_filters/todo_filter_event.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_filters/todo_filter_state.dart';
import 'package:bloc/bloc.dart';

class TodoFilterBloc extends Bloc<TodoFilterBlocEvent,TodoFilterBlocState>{
  TodoFilterBloc():super(TodoFilterBlocState.initial()){
    on<ChangeTodoFilterEvent>((event,emit){
      emit(state.copyWith(filter: event.filter));
    });
  }
}
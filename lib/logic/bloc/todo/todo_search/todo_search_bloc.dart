import 'package:babing_cubit/logic/bloc/todo/todo_search/todo_search_event.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_search/todo_search_state.dart';
import 'package:bloc/bloc.dart';

class TodoSearchBloc extends Bloc<TodoSearchBlocEvent,TodoSearchBlocState>{
  TodoSearchBloc():super(TodoSearchBlocState.initial()){
    on<SetSearchWordEvent>((event,emit){
      emit(state.copyWith(searchItem: event.searchKeyword));
    });
  }
}
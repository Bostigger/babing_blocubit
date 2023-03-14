import 'package:babing_cubit/logic/cubit/todo_search/todo_search_state.dart';
import 'package:bloc/bloc.dart';

class TodoSearchCubit extends Cubit<TodoSearchState>{
   TodoSearchCubit():super(TodoSearchState.initial());

   void setSearchWord(String searchKeyword){
     emit(state.copyWith(searchItem: searchKeyword));
   }
}
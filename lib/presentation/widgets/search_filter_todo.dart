import 'package:babing_cubit/data/models/todo_model.dart';
import 'package:babing_cubit/logic/cubit/todo_filter/todo_filter_cubit.dart';
import 'package:babing_cubit/logic/cubit/todo_search/todo_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAndFilterTodo extends StatefulWidget {
  const SearchAndFilterTodo({Key? key}) : super(key: key);

  @override
  State<SearchAndFilterTodo> createState() => _SearchAndFilterTodoState();
}

class _SearchAndFilterTodoState extends State<SearchAndFilterTodo> {
  TextEditingController searchTextController = TextEditingController();

  @override
  void dispose() {
    searchTextController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: searchTextController,
          decoration: InputDecoration(
            filled: true,
            prefixIcon: Icon(Icons.search)
          ),
          onChanged: (String? searchText){
            if(searchText != null){
              context.read<TodoSearchCubit>().setSearchWord(searchText);
            }
          },
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            FilterButton(context,Filter.all),
            FilterButton(context,Filter.active),
            FilterButton(context,Filter.completed),
          ],
        )
      ],
    );
  }
}

Widget FilterButton(BuildContext context,Filter filter){
  return TextButton(onPressed: (){
    context.read<TodoFilterCubit>().changeFilter(filter);
  },
      child: Text(filter==Filter.all ? 'All':filter==Filter.active?'Active':'Completed',
        style: TextStyle(fontSize: 18,color: TextColor(context, filter)),));
}
Color TextColor(BuildContext context,Filter filter){
  final currFilter = context.watch<TodoFilterCubit>().state.filter;
  return currFilter==filter? Colors.lightBlue:Colors.grey;
}

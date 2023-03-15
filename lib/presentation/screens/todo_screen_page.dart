import 'package:babing_cubit/logic/cubit/todo_count/active_todo_count_cubit.dart';
import 'package:babing_cubit/logic/cubit/todos/todo_list_cubit.dart';
import 'package:babing_cubit/presentation/widgets/search_filter_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/create_todo.dart';
import '../widgets/filtered_todo_list.dart';

class TodoScreenPage extends StatelessWidget {
  const TodoScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("MyTodoApp"),
            Text('${context.watch<TodoListCubit>().state.myTodos.toList().length} items'),
          ],
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreateTodo(),
            SizedBox(height:20),
            SearchAndFilterTodo(),
            FilteredTodosList()
          ],
        ),
      ),
    );
  }
}

import 'package:babing_cubit/logic/bloc/todo/todo_list/todo_list_bloc.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_list/todo_list_event.dart';
import 'package:babing_cubit/logic/cubit/todos/todo_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/todo_count/active_todo_count_cubit.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  TextEditingController todoController = TextEditingController();

  @override
  void dispose() {
   todoController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: todoController,
        decoration: InputDecoration(
          hintText: 'Enter New Todo',
        ),
        onSubmitted: (String? todoItem){
          if(todoItem != null && todoItem.trim().isNotEmpty){
            context.read<TodoListBloc>().add(AddTodoEvent(description: todoItem));
          }
        },
      ),
    );
  }
}

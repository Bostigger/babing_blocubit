import 'package:babing_cubit/logic/cubit/todo_count/active_todo_count_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreenPage extends StatelessWidget {
  const TodoScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("MyTodoApp"),
            Text('${context.read<ActiveTodoCountCubit>().state.myTotalActiveTodos} items'),
          ],
        )
        ,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
    );
  }
}

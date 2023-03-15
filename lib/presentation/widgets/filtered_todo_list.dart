import 'package:babing_cubit/data/models/todo_model.dart';
import 'package:babing_cubit/logic/cubit/filtered_todos/filtered_todos_cubit.dart';
import 'package:babing_cubit/logic/cubit/todos/todo_list_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilteredTodosList extends StatelessWidget {
  const FilteredTodosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = context.read<FilteredTodosCubit>().state.filteredTodos;
    print(todos);
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
        separatorBuilder: (BuildContext context,int idx){
          return Divider(color: Colors.grey,);
        },
        itemCount: todos.length,
         itemBuilder: (BuildContext context,index){
          return Dismissible(
              key: ValueKey(todos[index].id),
              background: showBackground(0),
              secondaryBackground: showBackground(1),
              onDismissed: (_){
                context.read<TodoListCubit>().removeTodoItem(todos[index]);
              },
              child: TodoItem(todo: todos[index]));
         },
    );
  }
}
Widget showBackground(int direction){
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.symmetric(horizontal: 20),
    color: Colors.red,
    alignment: direction==0?Alignment.centerLeft:Alignment.centerRight,
    child: Text('Delete'),
  );
}
class TodoItem extends StatefulWidget {
  final Todo todo;
  const TodoItem({Key? key, required this.todo}) : super(key: key);


  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.todo.completed, onChanged: (bool? value) {  },
      ),
      title: Text(widget.todo.description),
    );
  }
}


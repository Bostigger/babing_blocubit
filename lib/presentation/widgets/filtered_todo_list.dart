import 'package:babing_cubit/data/models/todo_model.dart';
import 'package:babing_cubit/logic/cubit/filtered_todos/filtered_todos_cubit.dart';
import 'package:babing_cubit/logic/cubit/filtered_todos/filtered_todos_state.dart';
import 'package:babing_cubit/logic/cubit/todos/todo_list_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilteredTodosList extends StatelessWidget {
  const FilteredTodosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredTodosCubit, FilteredTodosState>(
      builder: (context, state) {
        final todos = state.filteredTodos;
        return ListView.separated(
          primary: false,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int idx) {
            return Divider(
              color: Colors.grey,
            );
          },
          itemCount: todos.length,
          itemBuilder: (BuildContext context, index) {
            return Dismissible(
              key: ValueKey(todos[index].id),
              background: showBackground(0),
              secondaryBackground: showBackground(1),
              onDismissed: (_) {
                context.read<TodoListCubit>().removeTodoItem(todos[index]);
              },
              child: TodoItem(todo: todos[index]),
            );
          },
        );
      },
    );
  }
}

Widget showBackground(int direction) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    color: Colors.red,
    alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
    child: const Text('Delete'),
  );
}

class TodoItem extends StatefulWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late final TextEditingController todoEditingController;

  @override
  void initState() {
    todoEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    todoEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              bool error = false;
              todoEditingController.text = widget.todo.description;
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  title: const Text('Edit Todo'),
                  content: TextField(
                    controller: todoEditingController,
                    autofocus: true,
                    decoration: InputDecoration(
                      errorText: error ? "Value cant not be empty" : null,

                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel')),
                    TextButton(
                        onPressed: () {
                          // print("am here");
                          setState((){
                            error  = todoEditingController.text.isNotEmpty?false:true;
                            if(!error){
                              if (todoEditingController.text.isNotEmpty) {
                                context.read<TodoListCubit>().editTodo(
                                    widget.todo.id, todoEditingController.text);
                                Navigator.of(context).pop();
                              }
                            }
                          });
                        },
                        child: const Text('Update'))
                  ],
                );
              });
            });
      },
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: (bool? value) {
          context.read<TodoListCubit>().toggleCompletion(widget.todo.id);
        },
      ),
      title: Text(widget.todo.description),
    );
  }
}

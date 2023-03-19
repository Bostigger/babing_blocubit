
import 'package:babing_cubit/logic/bloc/todo/filtered_todos/filtered_todos_bloc.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_count/active_todo_count_bloc.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_filters/todo_filter_bloc.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_list/todo_list_bloc.dart';
import 'package:babing_cubit/logic/bloc/todo/todo_search/todo_search_bloc.dart';
import 'package:babing_cubit/logic/cubit/todo_search/todo_search_cubit.dart';
import 'package:babing_cubit/logic/cubit/todos/todo_list_cubit.dart';
import 'package:babing_cubit/presentation/routes/app_router.dart';

import 'package:babing_cubit/presentation/screens/todo_screen_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/cubit/filtered_todos/filtered_todos_cubit.dart';
import 'logic/cubit/todo_count/active_todo_count_cubit.dart';
import 'logic/cubit/todo_filter/todo_filter_cubit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter appRouter = AppRouter();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    appRouter.dispose();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TodoListBloc>(create: (context)=>TodoListBloc()),
          BlocProvider<TodoSearchBloc>(create: (context)=>TodoSearchBloc()),
          BlocProvider<TodoFilterBloc>(create: (context)=>TodoFilterBloc()),
          BlocProvider<ActiveTodoCountBloc>(create: (context)=>ActiveTodoCountBloc(totalActiveItems: context.read<TodoListBloc>().state.myTodos.length, todoListBloc: context.read<TodoListBloc>())),
          BlocProvider<FilteredTodosBloc>(create: (context)=>FilteredTodosBloc(todosListBloc: context.read<TodoListBloc>(), todoSearchBloc: context.read<TodoSearchBloc>(), todoFilterBloc: context.read<TodoFilterBloc>(), initialFilteredTodos: context.read<TodoListBloc>().state.myTodos)),
        ], child:  MaterialApp(
            title: 'Todo App-BLOC',
            debugShowCheckedModeBanner: false,
           onGenerateRoute: appRouter.onGenerateRoute,

    ),

    );
  }
}

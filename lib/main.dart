import 'package:babing_cubit/logic/cubit/bloc_cubit.dart';
import 'package:babing_cubit/presentation/routes/app_router.dart';
import 'package:babing_cubit/presentation/screens/counter_screen.dart';
import 'package:babing_cubit/presentation/screens/next_screen.dart';
import 'package:babing_cubit/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
     onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}

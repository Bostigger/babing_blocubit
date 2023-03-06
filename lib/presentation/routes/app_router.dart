import 'package:babing_cubit/logic/bloc/counter_bloc.dart';
import 'package:babing_cubit/logic/cubit/bloc_cubit.dart';
import 'package:babing_cubit/presentation/screens/counter_screen.dart';
import 'package:babing_cubit/presentation/screens/next_screen.dart';
import 'package:babing_cubit/presentation/screens/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterBloc _counterBloc = CounterBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _counterBloc, child: CounterScreen()));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider ( create: (BuildContext context) {
                  return CounterCubit();
                },child: NextScreen(),));

      case '/third':
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider ( create: (BuildContext context) {
                  return CounterCubit();
                },child: ThirdScreen(),));
      default:
        return MaterialPageRoute(builder: (context) => CounterScreen());
    }
  }
  void dispose(){
    _counterBloc.close();
  }
}

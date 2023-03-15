
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/todo_screen_page.dart';

class AppRouter {
  //final CounterBloc _counterBloc = CounterBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => TodoScreenPage());
        break;

      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
  void dispose(){
   // _counterBloc.close();
  }
}

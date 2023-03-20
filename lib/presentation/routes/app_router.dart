
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class AppRouter {
  //final CounterBloc _counterBloc = CounterBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => HomeScreen());
        break;

      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
  void dispose(){
   // _counterBloc.close();
  }
}

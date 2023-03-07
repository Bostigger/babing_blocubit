import 'dart:math';

import 'package:babing_cubit/logic/bloc/theme/theme.bloc.dart';
import 'package:babing_cubit/logic/bloc/theme/theme.event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayLoadScreen extends StatelessWidget {
  const PayLoadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final nextValue = Random().nextInt(100);
         BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent(nextVal: nextValue));
        },
        child: Text('Change Theme'),
      ),
    );
  }
}

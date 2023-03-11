import 'package:babing_cubit/logic/bloc/color/color_bloc.dart';
import 'package:babing_cubit/logic/bloc/color/color_event.dart';
import 'package:babing_cubit/logic/bloc/score/score_bloc.dart';
import 'package:babing_cubit/logic/cubit/color/color_cubit.dart';
import 'package:babing_cubit/logic/cubit/color/color_state.dart';
import 'package:babing_cubit/logic/cubit/score/score_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bloc/score/score_event.dart';

class CubitsCommunication extends StatefulWidget {
  const CubitsCommunication({Key? key}) : super(key: key);

  @override
  State<CubitsCommunication> createState() => _CubitsCommunicationState();
}

class _CubitsCommunicationState extends State<CubitsCommunication> {
  int increment=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.watch<ColorBloc>().state.color,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<ColorBloc>().add(ChangeColorEvent());
                },
                child: Text(
                  'Change Color',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Counter: ${context.watch<ScoreBloc>().state.scoreCount}',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.read<ScoreBloc>().add(ChangeScoreEvent());
                },
                child: Text(
                  'Increment Counter',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

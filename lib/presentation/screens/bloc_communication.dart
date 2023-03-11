import 'package:babing_cubit/logic/bloc/color/color_bloc.dart';
import 'package:babing_cubit/logic/bloc/color/color_event.dart';
import 'package:babing_cubit/logic/bloc/color/color_state.dart';
import 'package:babing_cubit/logic/bloc/score/score_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bloc/score/score_event.dart';

class BlocCommunication extends StatefulWidget {
  const BlocCommunication({Key? key}) : super(key: key);

  @override
  State<BlocCommunication> createState() => _BlocCommunicationState();
}

class _BlocCommunicationState extends State<BlocCommunication> {
  int increment=1;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorBloc,ColorState>(
      listener: (context,state){
        if(state.color==Colors.lightBlue){
          increment=100;
        }else if(state.color==Colors.yellowAccent){
          increment=200;
        }else if(state.color==Colors.deepOrange){
          increment=-50;
        }
      },
      child: Scaffold(
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
                    context.read<ScoreBloc>().add(ChangeScoreEvent(incrementSize: increment));
                  },
                  child: Text(
                    'Increment Counter',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

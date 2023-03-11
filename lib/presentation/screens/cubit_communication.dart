import 'package:babing_cubit/logic/cubit/color/color_cubit.dart';
import 'package:babing_cubit/logic/cubit/color/color_state.dart';
import 'package:babing_cubit/logic/cubit/score/score_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitsCommunication extends StatefulWidget {
  const CubitsCommunication({Key? key}) : super(key: key);

  @override
  State<CubitsCommunication> createState() => _CubitsCommunicationState();
}

class _CubitsCommunicationState extends State<CubitsCommunication> {
  int increment=1;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorCubit,ColorState>(
      listener: (context,state){
        if(state.colorState==Colors.lightGreen){
          increment=100;
        }else if(state.colorState==Colors.cyan){
          increment=20;
        }else if(state.colorState==Colors.red){
          increment = -10;
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorCubit>().state.colorState,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<ColorCubit>().changeColors();
                },
                child: Text(
                  'Change Color',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Counter: ${context.watch<ScoreCubit>().state.scoreIncrement}',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.read<ScoreCubit>().changeScore(increment);
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

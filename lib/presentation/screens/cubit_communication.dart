import 'package:babing_cubit/logic/cubit/color/color_cubit.dart';
import 'package:babing_cubit/logic/cubit/score/score_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitsCommunication extends StatelessWidget {
  const CubitsCommunication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                context.read<ScoreCubit>().changeScore();
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

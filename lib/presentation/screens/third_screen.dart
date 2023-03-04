
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/bloc_cubit.dart';
import '../../logic/cubit/bloc_cubit_state.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Last Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Second Room Here",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16),
            BlocConsumer<CounterCubit, CounterState>(
                builder: (BuildContext context, state) {
                  if (state.initialValue < 0) {
                    return Column(
                      children: [
                        const Text("Eii we are in negative o"),
                        Text(
                          state.initialValue.toString(),
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        const Text("We are good!"),
                        Text(
                          state.initialValue.toString(),
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    );
                  }
                }, listener: (BuildContext context, state) {
              if (state.wasIncremented) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Incremented"),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Decremented"),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              }
            }),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrementCounter();
                  },
                  child: const Icon(Icons.remove),
                ),
                SizedBox(width: 32),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).incrementCounter();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

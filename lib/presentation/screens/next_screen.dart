
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/bloc_cubit.dart';
import '../../logic/cubit/bloc_cubit_state.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "State Managed with Cubit",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 16),
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
                  const SnackBar(
                    content: Text("Incremented"),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Decremented"),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              }
            }),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'increment',
                  backgroundColor: Colors.lightGreen,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrementCounter();
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 32),
                FloatingActionButton(
                  heroTag: 'decrement',
                  backgroundColor: Colors.lightGreen,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).incrementCounter();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              color: Colors.lightGreen,
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                'LAST ROOM ▶',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

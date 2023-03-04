import 'package:babing_cubit/cubit/bloc_cubit.dart';
import 'package:babing_cubit/cubit/bloc_cubit_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('initial state is CounterState(0, false)', () {
      expect(counterCubit.state, CounterState(initialValue: 0, wasIncremented: false));
    });

    test('incrementCounter emits CounterState(initialValue: 1, wasIncremented: true)', () {
      final expectedStates = [
        CounterState(initialValue: 1, wasIncremented: true),
      ];

      expectLater(counterCubit.stream, emitsInOrder(expectedStates));

      counterCubit.incrementCounter();
    });

    test('decrementCounter emits CounterState(initialValue: -1, wasIncremented: false)', () {
      final expectedStates = [
        CounterState(initialValue: -1, wasIncremented: false),
      ];

      expectLater(counterCubit.stream, emitsInOrder(expectedStates));

      counterCubit.decrementCounter();
    });
  });
}

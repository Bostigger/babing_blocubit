import 'package:babing_cubit/logic/cubit/bloc_cubit_state.dart';
import 'package:test/test.dart';


void main() {
  group('CounterState', () {
    test('should return true when comparing two identical CounterState objects', () {
      final counterState1 = CounterState(initialValue: 0, wasIncremented: true);
      final counterState2 = CounterState(initialValue: 0, wasIncremented: true);
      expect(counterState1, equals(counterState2));
    });

    test('should return false when comparing two different CounterState objects', () {
      final counterState1 = CounterState(initialValue: 0, wasIncremented: true);
      final counterState2 = CounterState(initialValue: 1, wasIncremented: false);
      expect(counterState1, isNot(equals(counterState2)));
    });
  });
}

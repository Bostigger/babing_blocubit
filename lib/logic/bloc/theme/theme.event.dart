
import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable{
  const ThemeEvent();

}

class ChangeThemeEvent extends ThemeEvent{
  final int nextVal;
  ChangeThemeEvent({required this.nextVal});
  @override
  // TODO: implement props
  List<Object?> get props => [nextVal];
}


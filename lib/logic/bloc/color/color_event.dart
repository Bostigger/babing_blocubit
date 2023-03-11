import 'package:equatable/equatable.dart';

abstract class ColorEvent extends Equatable{
  const ColorEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeColorEvent extends ColorEvent{}
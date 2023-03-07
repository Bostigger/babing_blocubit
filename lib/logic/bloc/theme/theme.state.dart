import 'package:equatable/equatable.dart';

enum ThemeStates {
  light,
  dark
}

class ThemeBlocState extends Equatable {
  final ThemeStates appThemeState;

  const ThemeBlocState({this.appThemeState = ThemeStates.light});

  @override
  List<Object?> get props => [appThemeState];

  ThemeBlocState copyWith({
    ThemeStates? appThemeState,
  }) {
    return ThemeBlocState(
      appThemeState: appThemeState ?? this.appThemeState,
    );
  }

  @override
  String toString() => 'ThemeBlocState(appThemeState: $appThemeState)';

  Map<String, dynamic> toJson() => {
    'appThemeState': appThemeState.toString(),
  };

  factory ThemeBlocState.fromJson(Map<String, dynamic> json) {
    return ThemeBlocState(
      appThemeState: json['appThemeState'] == 'ThemeStates.light'
          ? ThemeStates.light
          : ThemeStates.dark,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appThemeState': appThemeState.toString(),
    };
  }
  factory ThemeBlocState.initial(){
    return ThemeBlocState();
  }

  factory ThemeBlocState.fromMap(Map<String, dynamic> map) {
    return ThemeBlocState(
      appThemeState: map['appThemeState'] == 'ThemeStates.light'
          ? ThemeStates.light
          : ThemeStates.dark,
    );
  }
}

import 'package:flutter/material.dart';

class MainPageState {
  final int counterValue;
  final ThemeData themeData;

  MainPageState({
    required this.counterValue,
    required this.themeData,
  });

  MainPageState.initial():
        counterValue = 0,
        themeData = ThemeData.light();

  MainPageState copyWith({int? counterValue, ThemeData? themeData}) {
    return MainPageState(
      counterValue: counterValue ?? this.counterValue,
      themeData: themeData ?? this.themeData,
    );
  }
}

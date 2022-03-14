import 'package:flutter/material.dart';

class MainPageState {
  final int counterValue;
  final ThemeData themeData;
  final bool isLoading;
  final String city;
  final String temperature;

  MainPageState({
    required this.counterValue,
    required this.themeData,
    required this.isLoading,
    required this.city,
    required this.temperature,
  });

  MainPageState.initial()
      : counterValue = 0,
        themeData = ThemeData.light(),
        isLoading = false,
        city = "",
        temperature = "";

  MainPageState copyWith({
    int? counterValue,
    ThemeData? themeData,
    bool? isLoading,
    String? city,
    String? temperature,
  }) {
    return MainPageState(
      counterValue: counterValue ?? this.counterValue,
      themeData: themeData ?? this.themeData,
      isLoading: isLoading ?? this.isLoading,
      city: city ?? this.city,
      temperature: temperature ?? this.temperature,
    );
  }
}

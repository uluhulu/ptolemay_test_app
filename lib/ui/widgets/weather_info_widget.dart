import 'package:flutter/material.dart';

class WeatherInfoWidget extends StatelessWidget {
  final bool isLoading;
  final String city;
  final String temperature;

  const WeatherInfoWidget(
      {Key? key,
      required this.isLoading,
      required this.city,
      required this.temperature,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }
    if (city.isNotEmpty && temperature.isNotEmpty) {
      return Text(
        'Weather for $city: $temperature °C',
      );
    }
    return const Text(
      'Press the icon to get your location',
    );
  }
}

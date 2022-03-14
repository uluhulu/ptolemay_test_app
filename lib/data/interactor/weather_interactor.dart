import 'package:ptolemay_test_app/data/models/get_weather_response.dart';
import 'package:ptolemay_test_app/data/repositories/weather_repository.dart';
import 'package:ptolemay_test_app/services/location_service.dart';

class WeatherInteractor {
  final _locationService = LocationService();
  final _weatherRepository = WeatherRepository();

  Future<GetWeatherResponse> getWeather() async {
    var position = await _locationService.getPosition();
    var response = await _weatherRepository.getWeather(
        latitude: position.latitude, longitude: position.longitude);
    return response;
  }
}

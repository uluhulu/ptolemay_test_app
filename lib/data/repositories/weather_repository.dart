import 'package:ptolemay_test_app/data/models/get_weather_response.dart';
import 'package:ptolemay_test_app/services/api_service.dart';

class WeatherRepository {
  final ApiService apiService = ApiService();

  Future<GetWeatherResponse> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    var response =
        await apiService.dio.get("data/2.5/weather", queryParameters: {
      "lat": latitude,
      "lon": longitude,
      "appid": "b2f8b63eb8d37de685716c3605a57bbb",
      "units": "metric"
    });
    final getWeatherResponse = GetWeatherResponse.fromJson(response.data);
    return getWeatherResponse;
  }
}

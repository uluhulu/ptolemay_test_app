import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay_test_app/bloc/main_page_state.dart';
import 'package:ptolemay_test_app/data/interactor/weather_interactor.dart';

class MainPageBloc extends Cubit<MainPageState> {
  MainPageBloc() : super(MainPageState.initial());

  final _weatherInteractor = WeatherInteractor();

  void increaseCounter() {
    if (state.counterValue < 10) {
      if (!state.isDark) {
        emit(state.copyWith(counterValue: state.counterValue + 1));
      } else {
        state.counterValue == 9
            ? emit(state.copyWith(counterValue: state.counterValue + 1))
            : emit(state.copyWith(counterValue: state.counterValue + 2));
      }
    }
  }

  void decreaseCounter() {
    if (state.counterValue > 0) {
      if (!state.isDark) {
        emit(state.copyWith(counterValue: state.counterValue - 1));
      } else {
        state.counterValue == 1
            ? emit(state.copyWith(counterValue: state.counterValue - 1))
            : emit(state.copyWith(counterValue: state.counterValue - 2));
      }
    }
  }

  void changeThemeData() {
    emit(state.copyWith(isDark: !state.isDark));
  }

  void getWeather() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    var weatherResponse = await _weatherInteractor.getWeather();
    emit(state.copyWith(
      isLoading: false,
      city: weatherResponse.name,
      temperature: weatherResponse.main.temp.toString(),
    ));
  }
}

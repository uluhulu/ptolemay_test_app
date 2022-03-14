import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay_test_app/bloc/main_page_bloc.dart';
import 'package:ptolemay_test_app/bloc/main_page_state.dart';
import 'package:ptolemay_test_app/ui/widgets/weather_info_widget.dart';

class MainPage extends StatelessWidget {
  final String title;

  const MainPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<MainPageBloc, MainPageState>(
          builder: (BuildContext context, state) {
        final cubit = BlocProvider.of<MainPageBloc>(context);
        return Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  WeatherInfoWidget(
                    isLoading: state.isLoading,
                    city: state.city,
                    temperature: state.temperature,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        cubit.getWeather();
                      },
                      child: const Icon(Icons.cloud),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        cubit.changeThemeData();
                      },
                      child: const Icon(Icons.palette),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedScale(
                      scale: state.counterValue == 10 ? 0 : 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: FloatingActionButton(
                        onPressed: () {
                          cubit.increaseCounter();
                        },
                        child: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AnimatedScale(
                      scale: state.counterValue == 0 ? 0 : 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: FloatingActionButton(
                        onPressed: () {
                          cubit.decreaseCounter();
                        },
                        child: const Icon(Icons.horizontal_rule),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

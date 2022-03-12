import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay_test_app/bloc/main_page_bloc.dart';
import 'package:ptolemay_test_app/bloc/main_page_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageBloc(),
      child: BlocBuilder<MainPageBloc, MainPageState>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            theme: state.themeData,
            home: const MyHomePage(title: 'Weather Counter'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<MainPageBloc, MainPageState>(
          builder: (BuildContext context, state) {
        var cubit = BlocProvider.of<MainPageBloc>(context);
        return Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Press the icon to get your location',
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
                      onPressed: () {},
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

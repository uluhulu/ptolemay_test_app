import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay_test_app/bloc/main_page_bloc.dart';
import 'package:ptolemay_test_app/bloc/main_page_state.dart';
import 'package:ptolemay_test_app/ui/main_page.dart';
import 'package:ptolemay_test_app/utils/animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageBloc(),
      child: MaterialApp(
        theme: ThemeData(),
        home: const DarkSample(),
      ),
    );
  }
}

class DarkSample extends StatefulWidget {
  const DarkSample({Key? key}) : super(key: key);

  @override
  _DarkSampleState createState() => _DarkSampleState();
}

class _DarkSampleState extends State<DarkSample> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final circleOffset = Offset(40, size.height - 40);
    return BlocBuilder<MainPageBloc, MainPageState>(
        builder: (BuildContext context, state) {
      return DarkTransition(
        childBuilder: (context, x) => const MainPage(
          title: 'Weather Counter',
        ),
        offset: circleOffset,
        isDark: state.isDark,
      );
    });
  }
}

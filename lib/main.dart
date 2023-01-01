import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_bloc/bloc/game_data_bloc.dart';
import 'package:game_bloc/repo/games_repo.dart';
import 'package:game_bloc/screens/landing_page.dart';

void main() {
  runApp(BlocProvider<GameDataBloc>(
    create: (context) => GameDataBloc(GamesRepo()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
    );
  }
}

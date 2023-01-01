import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_bloc/bloc/game_data_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameDataBloc, GameDataState>(
      builder: (context, state) {
        if (state is GameDataInitial) {
          context.read<GameDataBloc>().add(LoadGameData());
          return const Center(child: CircularProgressIndicator());
        } else if (state is GameDataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GameDataLoaded) {
          return Text("Data is loaded");
        } else if (state is GameDataError) {
          return Text("Something went wrong");
        }

        return Text("Error");
      },
    );
  }
}

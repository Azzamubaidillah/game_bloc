import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_bloc/bloc/game_data_bloc.dart';
import 'package:game_bloc/model/data_model.dart';
import 'package:game_bloc/routes/custom_router.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameDataBloc, GameDataState>(
        builder: (context, state) {
          if (state is GameDataInitial) {
            context.read<GameDataBloc>().add(LoadGameData());
            return const Center(child: CircularProgressIndicator());
          } else if (state is GameDataLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GameDataLoaded) {
            return buildGameModel(state.dataModels);
          } else if (state is GameDataError) {
            return Center(child: Text("Something went wrong"));
          }

          return Center(child: Text("Error"));
        },
      ),
    );
  }

  Widget buildGameModel(List<DataModel> apiResult) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: apiResult.length,
        itemBuilder: (context, index) {
          final DataModel dataModel = apiResult[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: InkWell(
              onTap: () {
                context.router.push(DetailRoute(dataModel: dataModel));
              },
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        image: NetworkImage(dataModel.image),
                        fit: BoxFit.cover,
                        height: 230,
                        width: MediaQuery.of(context).size.width / 1.05,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: GlassmorphicContainer(
                        width: MediaQuery.of(context).size.width / 1.05,
                        height: 120,
                        border: 0,
                        borderRadius: 0,
                        blur: 20,
                        alignment: Alignment.bottomCenter,
                        linearGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFFffffff).withOpacity(0.1),
                              const Color(0xFFFFFFFF).withOpacity(0.05),
                            ],
                            stops: const [
                              0.1,
                              1,
                            ]),
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFffffff).withOpacity(0.5),
                            Color(0xFFFFFFFF).withOpacity(0.5),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  dataModel.title,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Platform: ${dataModel.platforms}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

import 'package:bloc/bloc.dart';
import 'package:game_bloc/model/data_model.dart';
import 'package:game_bloc/repo/games_repo.dart';
import 'package:meta/meta.dart';

part 'game_data_event.dart';
part 'game_data_state.dart';

class GameDataBloc extends Bloc<GameDataEvent, GameDataState> {
  final GamesRepo gamesRepo;

  GameDataBloc(this.gamesRepo) : super(GameDataInitial()) {
    on<GameDataEvent>((event, emit) async {
      if (event is LoadGameData) {
        emit(GameDataLoading());
        List<DataModel>? dataModels = await gamesRepo.getGamesData();
        if (dataModels != null) {
          emit(GameDataLoaded(dataModels: dataModels));
        } else {
          emit(GameDataError(message: 'Error loading data'));
        }
      }
    });
  }
}

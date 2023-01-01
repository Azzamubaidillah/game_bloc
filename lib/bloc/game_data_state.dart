part of 'game_data_bloc.dart';

@immutable
abstract class GameDataState {}

class GameDataInitial extends GameDataState {}

class GameDataLoading extends GameDataState {}

class GameDataLoaded extends GameDataState {
  final List<DataModel> dataModels;
  GameDataLoaded({required this.dataModels});
}

class GameDataError extends GameDataState {
  final String message;
  GameDataError({required this.message});
} 

// Path: lib\bloc\game_data_event.dart
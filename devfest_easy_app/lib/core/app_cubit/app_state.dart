part of 'app_cubit.dart';

abstract class AppState {
  const AppState();
}

class AppInitial extends AppState {}

class AppChangeBottNavIndexState extends AppState {
  final int index;
  const AppChangeBottNavIndexState(this.index);
}

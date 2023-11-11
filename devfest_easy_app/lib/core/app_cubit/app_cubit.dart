import 'package:devfest_app/core/utils/common_libs.dart';
import 'package:devfest_app/pages/aboutus_page.dart';
import 'package:devfest_app/pages/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  int get bottNavIndex => _bottNavIndex;
  int _bottNavIndex = 0;

  List<Widget> get screens => _screens;
  List<Widget> _screens = [
    MainPage(),
    AboutUsPage(),
  ];

  static AppCubit get(context) => BlocProvider.of(context);

  void changeNav(int index) {
    _bottNavIndex = index;
    emit(AppChangeBottNavIndexState(bottNavIndex));
  }
}

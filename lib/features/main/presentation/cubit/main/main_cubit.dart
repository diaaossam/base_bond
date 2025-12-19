import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'main_state.dart';

@Injectable()
class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int index = 0;
  bool refreshHome = false;
  bool refreshPremium = false;
  bool refreshExplore = false;
  bool refreshChats = false;

  final List<Widget> screens = [];

  void changeCurrentBottomNavIndex({int? currentIndex}) {
    if (currentIndex != null) {
      if (currentIndex == 3) {
        screens.removeAt(3);
      }
      index = currentIndex;
      emit(ChangeCurrentIndexState(index: currentIndex));
    }
  }
}

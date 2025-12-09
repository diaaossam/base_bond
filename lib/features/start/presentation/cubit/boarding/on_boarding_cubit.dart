import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/intro_model.dart';

@LazySingleton()
class OnBoardingCubit extends Cubit<BaseState<List<IntroModel>>> {
  final SharedPreferences sharedPreferences;

  OnBoardingCubit(this.sharedPreferences) : super(BaseState.initial());

  bool isLast = false;

  void changePageViewState(bool from) {
    isLast = from;
    emit(state.success());
  }

  Future<void> submit() async {
    sharedPreferences.setBool(AppStrings.onBoarding, true);
    emit(state.success(identifier: "submit"));
  }

  Future<void> getIntroData() async {
    List<IntroModel> introList = [
      IntroModel(
        id: 1,
        title: S.current.boardingTitle1,
        description: S.current.boardingDescription1,
        image: Assets.images.boarding1.path,
      ),
      IntroModel(
        id: 1,
        title: S.current.boardingTitle1,
        description: S.current.boardingDescription1,
        image: Assets.images.boarding1.path,
      ),
      IntroModel(
        id: 1,
        title: S.current.boardingTitle1,
        description: S.current.boardingDescription1,
        image: Assets.images.boarding1.path,
      ),
    ];
    emit(state.success(data: introList));
  }
}

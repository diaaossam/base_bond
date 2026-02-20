import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
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
        image: Assets.icons.onBoarding1,
      ),
      IntroModel(
        id: 2,
        title: S.current.boardingTitle2,
        description: S.current.boardingDescription2,
        image: Assets.icons.onBoarding1,
      ),
      IntroModel(
        id: 3,
        title: S.current.boardingTitle3,
        description: S.current.boardingDescription3,
        image: Assets.icons.onBoarding1,
      ),
    ];
    emit(state.success(data: introList));
  }
}

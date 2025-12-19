import 'package:bond/core/global_models/generic_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
sealed class AppState with _$AppState {
  const AppState._();

  const factory AppState({
    @Default([]) List<GenericModel> governorates,
    @Default([]) List<GenericModel> cities,
    @Default(false) bool isLoadingCities,
    @Default(false) bool isLoadingGovernorates,
    String? errorMessage,
  }) = _AppState;
}

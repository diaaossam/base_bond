import 'package:bond/core/global_models/generic_model.dart';
import 'package:equatable/equatable.dart';

class AppStateData extends Equatable {
  final List<GenericModel> governorates;
  final List<GenericModel> cities;

  const AppStateData({this.governorates = const [], this.cities = const []});

  AppStateData copyWith({
    List<GenericModel>? governorates,
    List<GenericModel>? cities,
  }) {
    return AppStateData(
      governorates: governorates ?? this.governorates,
      cities: cities ?? this.cities,
    );
  }

  @override
  List<Object?> get props => [governorates, cities];
}

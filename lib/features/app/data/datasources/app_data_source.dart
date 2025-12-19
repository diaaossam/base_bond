import 'package:bond/core/services/api/dio_consumer.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/global_models/generic_model.dart';

abstract class AppDataSource {
  Future<List<GenericModel>> getGovernorates();

  Future<List<GenericModel>> getRegion({int? governorate});
}

@LazySingleton(as: AppDataSource)
class AppRemoteDataSourceImpl implements AppDataSource {
  final DioConsumer dioConsumer;

  AppRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<GenericModel>> getGovernorates() async {
    return await dioConsumer
        .get(EndPoints.governorates)
        .factory(GenericModel.fromJsonList)
        .execute();
  }

  @override
  Future<List<GenericModel>> getRegion({int? governorate}) async {
    return await dioConsumer
        .get("${EndPoints.governorates}/$governorate")
        .factory(GenericModel.fromJsonCitiesList)
        .execute();
  }
}

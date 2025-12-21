import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/core/services/api/api_handler_mixin.dart';
import 'package:bond/features/main/data/models/banners_model.dart';
import 'package:bond/features/main/data/models/category_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/network/error/failures.dart';
import '../datasources/main_remote_data_source.dart';

@LazySingleton()
class MainRepositoryImpl with ApiHandlerMixin {
  final MainRemoteDataSource mainRemoteDataSource;

  MainRepositoryImpl({required this.mainRemoteDataSource});

  Future<Either<Failure, List<BannersModel>>> getAllBanners() async {
    final response = await handleApi(
      () => mainRemoteDataSource.getAllBanners(),
    );
    return response;
  }
}

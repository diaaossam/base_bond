import 'package:bond/features/main/data/models/category_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../models/banners_model.dart';

abstract class MainRemoteDataSource {
  Future<List<BannersModel>> getAllBanners();

  Future<List<CategoryModel>> getCategories({required int pageKey});
}

@Injectable(as: MainRemoteDataSource)
class MainRemoteDataSourceImpl implements MainRemoteDataSource {
  final DioConsumer dioConsumer;

  MainRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<BannersModel>> getAllBanners() async {
    return await dioConsumer
        .get(EndPoints.sliders)
        .factory(BannersModel.fromJsonList)
        .execute();
  }

  @override
  Future<List<CategoryModel>> getCategories({required int pageKey}) async {
    return await dioConsumer
        .get(EndPoints.categories)
        .factory(CategoryModel.fromJsonList)
        .execute();
  }
}

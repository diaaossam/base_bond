import 'package:bond/features/main/data/models/category_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';
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
    return [];
    //final response = await dioConsumer.get(path)
    /* final response = await dioConsumer.get(path: EndPoints.sliders);
    final res = response['data']
        .map<BannersModel>((element) => BannersModel.fromJson(element))
        .toList();
    return ApiSuccessResponse(data: res as List<BannersModel>);*/
  }

  @override
  Future<List<CategoryModel>> getCategories({required int pageKey}) async {
    return [];
    /*    return [
      BannersModel(
        id: 1,
        image:
            'https://ichef.bbci.co.uk/news/1536/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp',
      ),
      BannersModel(
        id: 2,
        image:
            'https://ichef.bbci.co.uk/news/1536/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp',
      ),
      BannersModel(
        id: 3,
        image:
            'https://ichef.bbci.co.uk/news/1536/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp',
      ),
    ];*/
  }
}

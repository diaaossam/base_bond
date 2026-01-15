import 'package:bond/features/product/data/models/request/product_params.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/global_models/generic_model.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../../../main/data/models/category_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts(ProductParams params);

  Future<ProductModel> getProductDetails(num id);

  Future<List<CategoryModel>> getCategories();

  Future<List<GenericModel>> getSubCategories({required num id});

  Future<List<GenericModel>> getSubDivision({
    required num id,
    required num categoryId,
  });

  Future<List<GenericModel>> getBrands();

  Future<List<GenericModel>> getActiveSubstances();

  Future<Unit> toggleWishList(num productId);

  Future<List<ProductModel>> getWishList();

  Future<Unit> notifyWhenAvailable(num productId);
}

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final DioConsumer dioConsumer;

  ProductRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<ProductModel>> getProducts(ProductParams params) async {
    final data = await dioConsumer
        .get<List<ProductModel>>(EndPoints.products)
        .params(params.toJson())
        .factory(ProductModel.fromJsonList)
        .execute();
    return data;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    return await dioConsumer
        .get(EndPoints.categories)
        .factory(CategoryModel.fromJsonList)
        .execute();
  }

  @override
  Future<List<GenericModel>> getBrands() async {
    return await dioConsumer
        .get(EndPoints.brands)
        .factory(GenericModel.fromJsonList)
        .execute();
  }

  @override
  Future<ProductModel> getProductDetails(num id) async {
    return await dioConsumer
        .get("${EndPoints.products}/$id")
        .factory((json) => ProductModel.fromJson(json: json, isRemote: true))
        .execute();
  }

  @override
  Future<Unit> toggleWishList(num productId) async {
    return await dioConsumer
        .post("${EndPoints.favourites}/$productId/toggle")
        .factory((json) => null)
        .execute();
  }

  @override
  Future<List<ProductModel>> getWishList() async {
    final data = await dioConsumer
        .get<List<ProductModel>>(EndPoints.favourites)
        .factory(ProductModel.fromJsonList)
        .execute();

    return data;
  }

  @override
  Future<List<GenericModel>> getActiveSubstances() async {
    final data = await dioConsumer
        .get<List<GenericModel>>(EndPoints.activeSubstances)
        .factory(GenericModel.fromJsonList)
        .execute();

    return data;
  }

  @override
  Future<List<GenericModel>> getSubCategories({required num id}) async {
    final data = await dioConsumer
        .get<List<GenericModel>>(EndPoints.subCategory)
        .params({"category_id": id})
        .factory(GenericModel.fromJsonList)
        .execute();

    return data;
  }

  @override
  Future<List<GenericModel>> getSubDivision({
    required num id,
    required num categoryId,
  }) async {
    final data = await dioConsumer
        .get<List<GenericModel>>(EndPoints.subDivision)
        .params({"category_id": categoryId, "sub_category_id": id})
        .factory(GenericModel.fromJsonList)
        .execute();

    return data;
  }

  @override
  Future<Unit> notifyWhenAvailable(num productId) async {
    await dioConsumer
        .post(EndPoints.notifyWhenAvailable(productId))
        .factory((json) => null)
        .execute();
    return unit;
  }
}

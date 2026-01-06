import 'package:bond/core/services/api/api_handler_mixin.dart';
import 'package:bond/features/product/data/models/request/product_params.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/global_models/generic_model.dart';
import '../../../../core/services/network/error/failures.dart';
import '../../../main/data/models/category_model.dart';
import '../datasources/product_remote_data_source.dart';

@LazySingleton()
class ProductRepositoryImpl with ApiHandlerMixin {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  Future<Either<Failure, List<ProductModel>>> getProducts(
    ProductParams params,
  ) async {
    final response = await handleApi(
      () => productRemoteDataSource.getProducts(params),
    );
    return response;
  }

  Future<Either<Failure, ProductModel>> getProductDetails(num id) async {
    final response = await handleApi(
      () => productRemoteDataSource.getProductDetails(id),
    );
    return response;
  }

  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    final response = await handleApi(
      () => productRemoteDataSource.getCategories(),
    );
    return response;
  }

  Future<Either<Failure, List<GenericModel>>> getActiveSubstances() async {
    final response = await handleApi(
      () => productRemoteDataSource.getActiveSubstances(),
    );
    return response;
  }

  Future<Either<Failure, List<GenericModel>>> getSubcategory({
    required num id,
  }) async {
    final response = await handleApi(
      () => productRemoteDataSource.getSubCategories(id: id),
    );
    return response;
  }

  Future<Either<Failure, List<GenericModel>>> getSubDivision({
    required num id,
  }) async {
    final response = await handleApi(
      () => productRemoteDataSource.getSubDivision(id: id),
    );
    return response;
  }

  Future<Either<Failure, List<GenericModel>>> getBrands() async {
    final response = await handleApi(() => productRemoteDataSource.getBrands());
    return response;
  }

  Future<Either<Failure, Unit>> toggleWishList(num productId) async {
    final response = await handleApi(
      () => productRemoteDataSource.toggleWishList(productId),
    );
    return response;
  }

  Future<Either<Failure, List<ProductModel>>> getWishList() async {
    final response = await handleApi(
      () => productRemoteDataSource.getWishList(),
    );
    return response;
  }
}

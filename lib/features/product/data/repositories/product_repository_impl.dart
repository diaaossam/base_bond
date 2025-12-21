import 'package:bond/core/services/api/api_handler_mixin.dart';
import 'package:bond/features/product/data/models/request/product_params.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/network/error/failures.dart';
import '../datasources/product_remote_data_source.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getProducts(ProductParams params);
}

@LazySingleton()
class ProductRepositoryImpl with ApiHandlerMixin implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts(
      ProductParams params) async {
    final response = await handleApi(
      () => productRemoteDataSource.getProducts(params),
    );
    return response;
  }
}


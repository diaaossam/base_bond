import 'package:bond/features/product/data/models/request/product_params.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts(ProductParams params);
}

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final DioConsumer dioConsumer;

  ProductRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<ProductModel>> getProducts(ProductParams params) async {
    return await dioConsumer
        .get<List<ProductModel>>(EndPoints.products)
        .params(params.toJson())
        .factory(ProductModel.fromJsonList)
        .execute();
  }
}


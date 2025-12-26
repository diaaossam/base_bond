import 'package:bond/features/location/data/models/response/my_address.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/api/api_handler_mixin.dart';
import '../../../../core/services/network/error/failures.dart';
import '../datasources/location_remote_data_source.dart';
import '../models/requests/saved_location_params.dart';

@LazySingleton()
class LocationRepositoryImpl with ApiHandlerMixin {
  final LocationRemoteDataSource locationRemoteDataSource;

  LocationRepositoryImpl({required this.locationRemoteDataSource});

  Future<Either<Failure, String>> addNewAddress({
    required SavedLocationParams params,
    num? id,
  }) async {
    final response = await handleApi(
      () => locationRemoteDataSource.addNewAddress(params: params, id: id),
    );
    return response;
  }

  Future<Either<Failure, List<MyAddress>>> getMyAddress() async {
    final response = await handleApi(
      () => locationRemoteDataSource.getMyAddress(),
    );
    return response;
  }

  Future<Either<Failure, String>> makeAddressDefault({
    required MyAddress myAddress,
  }) async {
    final response = await handleApi(
      () => locationRemoteDataSource.makeAddressDefault(myAddress: myAddress),
    );
    return response;
  }

  Future<Either<Failure, String>> deleteAddress({required num id}) async {
    final response = await handleApi(
      () => locationRemoteDataSource.deleteAddress(id: id),
    );
    return response;
  }
}

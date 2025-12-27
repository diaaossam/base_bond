import 'package:bond/features/location/data/models/response/my_address.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../models/requests/saved_location_params.dart';

abstract class LocationRemoteDataSource {
  Future<String> addNewAddress({required SavedLocationParams params, num? id});

  Future<List<MyAddress>> getMyAddress();

  Future<String> makeAddressDefault({required MyAddress myAddress});

  Future<String> deleteAddress({required num id});
}

@Injectable(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final DioConsumer dioConsumer;
  final SharedPreferences sharedPreferences;

  LocationRemoteDataSourceImpl({
    required this.dioConsumer,
    required this.sharedPreferences,
  });

  @override
  Future<String> addNewAddress({
    required SavedLocationParams params,
    num? id,
  }) async {
    if (id != null) {
      return await dioConsumer
          .put("${EndPoints.addresses}/$id")
          .body(params.toJson())
          .factory((json) => json['message'])
          .execute();
    } else {
      return await dioConsumer
          .post(EndPoints.addresses)
          .body(params.toJson())
          .factory((json) => json['message'])
          .execute();
    }
  }

  @override
  Future<List<MyAddress>> getMyAddress() async {
    return await dioConsumer
        .get(EndPoints.addresses)
        .factory(MyAddress.fromJsonList)
        .execute();
  }

  @override
  Future<String> makeAddressDefault({required MyAddress myAddress}) async {
    final response = await dioConsumer
        .post("${EndPoints.addresses}/${myAddress.id}/set-default")
        .execute();
    return response['message'];
  }

  @override
  Future<String> deleteAddress({required num id}) async {
    return await dioConsumer
        .deleteRequest("${EndPoints.addresses}/$id")
        .factory((json) => json['message'])
        .execute();
  }
}

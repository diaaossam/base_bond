import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/services/caching/common_caching.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/helper/either_extensions.dart';
import '../../../data/models/requests/saved_location_params.dart';
import '../../../data/models/response/my_address.dart';
import '../../../data/repositories/location_repository_impl.dart';

@Injectable()
class MyAddressCubit extends Cubit<BaseState<List<MyAddress>>>
    with AsyncHandler<List<MyAddress>> {
  final LocationRepositoryImpl locationRepositoryImpl;

  MyAddressCubit(this.locationRepositoryImpl)
    : super(BaseState.initial(data: <MyAddress>[])) {
    getMyAddress();
  }

  MyAddress? defaultAddress;

  Future<void> getMyAddress() async {
    await handleAsync(
      identifier: 'getMyAddress',
      call: () => locationRepositoryImpl.getMyAddress(),
      onSuccess: (response) {
        for (var element in response) {
          if (element.isDefault == true) {
            defaultAddress = element;
            CommonCaching.address = defaultAddress;
          }
        }
        return response;
      },
    );
  }

  Future<void> addNewAddress({required SavedLocationParams params}) async {
    final result = await handleAsync(
      identifier: 'addNewAddress',
      call: () => locationRepositoryImpl.addNewAddress(params: params),
      onSuccess: (data) => state.data ?? [],
    );
    if (result != null) {
      Fluttertoast.showToast(msg: result);
      await getMyAddress();
    }
  }

  Future<void> updateAddress({
    required SavedLocationParams params,
    required num id,
  }) async {
    final result = await handleAsync(
      identifier: 'updateAddress',
      call: () => locationRepositoryImpl.addNewAddress(params: params, id: id),
      onSuccess: (data) => state.data ?? [],
    );
    if (result != null) {
      Fluttertoast.showToast(msg: result);
      await getMyAddress();
    }
  }

  Future<void> makeAddressDefault({required MyAddress myAddress}) async {
    final result = await handleAsync(
      identifier: 'makeAddressDefault',
      call: () =>
          locationRepositoryImpl.makeAddressDefault(myAddress: myAddress),
      onSuccess: (data) => state.data ?? [],
    );
    if (result != null) {
      Fluttertoast.showToast(msg: result);
      await getMyAddress();
    }
  }

  Future<void> deleteAddress({required num id}) async {
    final result = await handleAsync(
      identifier: 'deleteAddress',
      call: () => locationRepositoryImpl.deleteAddress(id: id),
      onSuccess: (data) {
        final updatedList = state.data?.where((e) => e.id != id).toList() ?? [];
        return updatedList;
      },
    );
    if (result != null) {
      Fluttertoast.showToast(msg: result);
    }
  }
}

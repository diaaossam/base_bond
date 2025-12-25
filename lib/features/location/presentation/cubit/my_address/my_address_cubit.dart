import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/helper/either_extensions.dart';
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

  Future<void> getMyAddress() async {
    await handleAsync(
      identifier: 'getMyAddress',
      call: () => locationRepositoryImpl.getMyAddress(),
      onSuccess: (response) => response,
    );
  }

  Future<void> makeAddressDefault({required MyAddress myAddress}) async {
    await handleAsync(
      identifier: 'makeAddressDefault',
      call: () =>
          locationRepositoryImpl.makeAddressDefault(myAddress: myAddress),
      onSuccess: (data) => state.data ?? [],
    );
  }

  Future<void> deleteAddress({required num id}) async {
    await handleAsync(
      identifier: 'deleteAddress',
      call: () => locationRepositoryImpl.deleteAddress(id: id),
      onSuccess: (data) => state.data ?? [],
    );
  }
}

import 'package:aslol/features/location/data/models/response/my_address.dart';
import 'package:aslol/features/location/domain/usecases/delete_address_use_case.dart';
import 'package:aslol/features/location/domain/usecases/get_address_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../data/models/response/my_address.dart';
import '../../../domain/usecases/make_address_default_use_case.dart';

part 'my_address_state.dart';

@Injectable()
class MyAddressCubit extends Cubit<BaseState<List<MyAddress>>> {
  final GetAddressUseCase getAddressUseCase;
  final MakeAddressDefaultUseCase makeAddressDefaultUseCase;
  final DeleteAddressUseCase deleteAddressUseCase;

  MyAddressCubit(
    this.getAddressUseCase,
    this.makeAddressDefaultUseCase,
    this.deleteAddressUseCase,
  ) : super(MyAddressInitial()) {
    getMyAddress();
  }

  List<MyAddress> addressList = [];

  Future<void> getMyAddress() async {
    emit(GetMyAddressLoading());
    final response = await getAddressUseCase();
    emit(
      response.fold((l) => GetMyAddressFailure(msg: l.msg), (r) {
        addressList = r.data;
        return GetMyAddressSuccess();
      }),
    );
  }

  Future<void> makeAddressDefault({required MyAddress myAddress}) async {
    emit(MakeAddressDefaultLoading());
    final response = await makeAddressDefaultUseCase(myAddress: myAddress);
    emit(
      response.fold(
        (l) => MakeAddressDefaultFailure(msg: l.msg),
        (r) => MakeAddressDefaultSuccess(
          msg: r.message ?? "",
          myAddress: myAddress,
        ),
      ),
    );
  }

  Future<void> deleteAddress({required num id}) async {
    emit(DeleteAddressLoading());
    final response = await deleteAddressUseCase(id: id);
    emit(
      response.fold((l) => DeleteAddressFailure(msg: l.msg), (r) {
        addressList.removeWhere((element) => element.id == id);
        return DeleteAddressSuccess(msg: r.message ?? "");
      }),
    );
  }
}

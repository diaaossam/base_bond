import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/helper/either_extensions.dart';
import '../../../data/models/requests/saved_location_params.dart';
import '../../../data/repositories/location_repository_impl.dart';

@Injectable()
class AddNewAddressCubit extends Cubit<BaseState<void>>
    with AsyncHandler<void> {
  final LocationRepositoryImpl locationRepositoryImpl;

  AddNewAddressCubit(this.locationRepositoryImpl) : super(BaseState());

  Future<void> addNewAddress({
    required SavedLocationParams saved,
    num? id,
  }) async {
    await handleAsync(
      identifier: 'products',
      call: () => locationRepositoryImpl.addNewAddress(params: saved, id: id),
      onSuccess: (data) => data,
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/global_models/generic_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/helper/either_extensions.dart';
import '../../../data/repositories/product_repository_impl.dart';

@Injectable()
class ActiveSubstancesCubit extends Cubit<BaseState<List<GenericModel>>>
    with AsyncHandler<List<GenericModel>> {
  final ProductRepositoryImpl productRepository;

  ActiveSubstancesCubit(this.productRepository) : super(BaseState.initial());

  Future<void> getActiveSubstances() async {
    await handleAsync(
      call: () => productRepository.getActiveSubstances(),
      onSuccess: (data) => data,
    );
  }
}

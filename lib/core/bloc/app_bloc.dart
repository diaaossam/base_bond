import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nested/nested.dart';

import '../../config/dependencies/injectable_dependencies.dart';
import 'global_cubit/global_cubit.dart';

class AppBloc {
  static List<SingleChildWidget> providers = [
    BlocProvider(create: (context) => sl<GlobalCubit>()..getAppSettings()),
  ];
}

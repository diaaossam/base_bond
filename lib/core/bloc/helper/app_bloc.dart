import 'package:bond/features/orders/presentation/cubit/cart/cart_cubit.dart';
import 'package:bond/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nested/nested.dart';

import '../../../config/dependencies/injectable_dependencies.dart';
import '../global_cubit/global_cubit.dart';

class AppBloc {
  static List<SingleChildWidget> providers = [
    BlocProvider(create: (context) => sl<GlobalCubit>()..getAppSettings()),
    BlocProvider(create: (context) => sl<SettingsCubit>()),
    BlocProvider(create: (context) => sl<CartCubit>()),
  ];
}

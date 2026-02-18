import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/helper/context_helper.dart';
import 'config/router/app_router.dart';
import 'core/bloc/helper/app_bloc.dart';
import 'config/theme/app_theme.dart';
import 'core/bloc/global_cubit/global_cubit.dart';
import 'core/utils/app_strings.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: Builder(
        builder: (context) {
          return BlocBuilder<GlobalCubit, void>(
            builder: (context, state) {
              final bloc = context.read<GlobalCubit>();
              return ScreenUtilInit(
                designSize: const Size(360, 850),
                minTextAdapt: true,
                splitScreenMode: true,
                child: MaterialApp.router(
                  scaffoldMessengerKey: NavigationService.navigatorKey,
                  routerConfig: _appRouter.config(navigatorObservers: () => []),
                  title: AppStrings.appName,
                  builder: (context, child) {
                    return SafeArea(
                      bottom: true,
                      left: false,
                      right: false,
                      top: false,
                      child: child!,
                    );
                  },
                  debugShowCheckedModeBanner: false,
                  theme: ThemeManger.appTheme(language: bloc.language),
                  darkTheme: ThemeManger.blackTheme(language: bloc.language),
                  locale: bloc.locale,
                  themeMode: bloc.themeMode,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

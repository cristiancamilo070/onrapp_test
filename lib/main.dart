// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:onrapp_test/core/controllers/main_bloc.dart';
import 'package:onrapp_test/core/controllers/main_event.dart';
import 'package:onrapp_test/core/routes/path_routes.dart';
import 'package:onrapp_test/data/providers/fake_store_provider.dart';
import 'package:onrapp_test/data/repositories/fake_store_repository_impl.dart';
import 'package:onrapp_test/domain/repositories/fake_store_repository.dart';
import 'package:onrapp_test/domain/use_cases/fake_store_use_cases/get_all_products_use_case.dart';
import 'package:onrapp_test/domain/use_cases/fake_store_use_cases/get_product_by_id_use_case.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Dio>(create: (_) => Dio()),
        RepositoryProvider<FakeStoreProvider>(
          create: (context) => FakeStoreProvider(context.read<Dio>()),
        ),
        RepositoryProvider<FakeStoreRepository>(
          create: (context) => FakeStoreRepositoryImpl(
            context.read<FakeStoreProvider>(),
          ),
        ),
        RepositoryProvider<GetAllProductsUseCase>(
          create: (context) => GetAllProductsUseCase(
            context.read<FakeStoreRepository>(),
          ),
        ),
        RepositoryProvider<GetProductDetailUseCase>(
          create: (context) => GetProductDetailUseCase(
            context.read<FakeStoreRepository>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(
            create: (_) => MainBloc()..add(InitMainEvent()),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'GitHub commit history',
              theme: ThemeData(
                useMaterial3: false,
                scaffoldBackgroundColor: Colors.white,
                fontFamily: 'Montserrat',
                appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                ),
              ),
              builder: EasyLoading.init(),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routerConfig: goRouter,
            );
          },
        ),
      ),
    );
  }
}

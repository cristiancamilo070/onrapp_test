// File: main_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.initial()) {
    on<InitMainEvent>(_onInitMain);
  }

  Future<void> _onInitMain(
    InitMainEvent event,
    Emitter<MainState> emit,
  ) async {
    // Simula la inicialización que hacías en _initDependencies()
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // Actualizamos el estado con la versión de la app
    emit(
      state.copyWith(
        appVersion: packageInfo.version,
        isReadyDependencies: true,
      ),
    );
  }
}

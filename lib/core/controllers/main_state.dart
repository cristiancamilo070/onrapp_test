// File: main_state.dart

import 'package:equatable/equatable.dart';

class MainState extends Equatable {
  final String appVersion;
  final bool isReadyDependencies;

  const MainState({
    required this.appVersion,
    required this.isReadyDependencies,
  });

  factory MainState.initial() {
    return const MainState(
      appVersion: '',
      isReadyDependencies: false,
    );
  }

  MainState copyWith({
    String? appVersion,
    bool? isReadyDependencies,
  }) {
    return MainState(
      appVersion: appVersion ?? this.appVersion,
      isReadyDependencies: isReadyDependencies ?? this.isReadyDependencies,
    );
  }

  @override
  List<Object> get props => [appVersion, isReadyDependencies];
}

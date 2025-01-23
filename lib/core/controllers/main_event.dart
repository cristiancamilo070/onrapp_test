// File: main_event.dart

import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class InitMainEvent extends MainEvent {}

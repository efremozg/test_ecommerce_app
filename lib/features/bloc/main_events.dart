import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => [];
}

class MainSuccessConnectionEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}

class MainNoConnectionEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}

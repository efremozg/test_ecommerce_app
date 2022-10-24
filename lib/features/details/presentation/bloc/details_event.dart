import 'package:equatable/equatable.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadDetailsEvent extends DetailsEvent {
  @override
  List<Object?> get props => [];
}

class DetailsNoConnectionEvent extends DetailsEvent {
  @override
  List<Object?> get props => [];
}

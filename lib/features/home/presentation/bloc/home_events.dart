import 'package:equatable/equatable.dart';
import 'package:flutter_test_ecommerce_internship/features/home/data/models/home_model.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

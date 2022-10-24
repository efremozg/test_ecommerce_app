import 'package:equatable/equatable.dart';
import 'package:flutter_test_ecommerce_internship/features/home/data/models/home_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<BestSeller>? loadedBestSeller;
  final List<HomeStore>? loadedHotSales;

  const HomeLoadedState(
      {required this.loadedBestSeller, required this.loadedHotSales});

  @override
  List<Object?> get props => [loadedHotSales, loadedBestSeller];
}

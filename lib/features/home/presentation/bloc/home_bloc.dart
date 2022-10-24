import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_ecommerce_internship/components/connectivity_service.dart';
import 'package:flutter_test_ecommerce_internship/features/home/data/datasource/home_datasource.dart';
import 'package:flutter_test_ecommerce_internship/features/home/presentation/bloc/home_events.dart';
import 'package:flutter_test_ecommerce_internship/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeDataRemoteService _homeDataRemoteService;

  HomeBloc({required HomeDataRemoteService homeDataRemoteService})
      : _homeDataRemoteService = homeDataRemoteService,
        super(HomeLoadingState()) {
    on<LoadHomeEvent>(onHomeLoaded);
  }

  void onHomeLoaded(LoadHomeEvent event, Emitter<HomeState> emit) async {
    final bestSellerInfo = await _homeDataRemoteService.getBestSeller();
    final hotSalesInfo = await _homeDataRemoteService.getHotSales();
    emit(HomeLoadedState(
        loadedBestSeller: bestSellerInfo, loadedHotSales: hotSalesInfo));
  }
}

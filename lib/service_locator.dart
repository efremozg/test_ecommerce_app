import 'package:flutter_test_ecommerce_internship/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_test_ecommerce_internship/features/details/presentation/bloc/details_bloc.dart';
import 'package:flutter_test_ecommerce_internship/features/home/data/datasource/home_datasource.dart';
import 'package:flutter_test_ecommerce_internship/features/home/data/models/home_model.dart';
import 'package:flutter_test_ecommerce_internship/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/cart/data/datasource/cart_datasource.dart';
import 'features/details/data/datasource/details_datasource.dart';

final getIt = GetIt.instance;

Future<void> setUpServiceLocator() async {
  //bloc pattern
  getIt.registerFactory<HomeBloc>(
      () => HomeBloc(homeDataRemoteService: getIt()));
  getIt.registerFactory<DetailsBloc>(
      () => DetailsBloc(detailsDataRemoteService: getIt()));
  getIt.registerFactory<CartBloc>(
      () => CartBloc(cartDataRemoteService: getIt()));

  //service
  getIt.registerLazySingleton<HomeDataRemoteService>(
      () => HomeDataRemoteService());
  getIt.registerLazySingleton<DetailsDataRemoteService>(
      () => DetailsDataRemoteService());
  getIt.registerLazySingleton<CartDataRemoteService>(
      () => CartDataRemoteService());

  getIt.registerFactory<Main>(() => Main());
}

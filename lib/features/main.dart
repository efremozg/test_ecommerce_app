import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_ecommerce_internship/features/bloc/main_state.dart';
import 'package:flutter_test_ecommerce_internship/features/cart/domain/usecases/badge_notifier.dart';
import 'package:flutter_test_ecommerce_internship/features/home/data/datasource/home_datasource.dart';
import 'package:flutter_test_ecommerce_internship/features/home/presentation/screens/home/home_screen.dart';
import 'package:flutter_test_ecommerce_internship/components/no_connection_widget.dart';
import 'package:flutter_test_ecommerce_internship/service_locator.dart';
import 'package:provider/provider.dart';

import '../components/connectivity_service.dart';
import 'bloc/main_bloc.dart';
import 'bloc/main_events.dart';
import 'cart/data/datasource/cart_datasource.dart';
import 'details/data/datasource/details_datasource.dart';

void main() {
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => BadgeNotify())],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: ((context) => HomeDataRemoteService()),
          ),
          RepositoryProvider(
            create: ((context) => CartDataRemoteService()),
          ),
          RepositoryProvider(
            create: ((context) => DetailsDataRemoteService()),
          ),
          RepositoryProvider(
            create: ((context) => ConnectivityService()),
          ),
        ],
        child: BlocProvider(
          create: (context) => MainBloc(
            connectivityService:
                RepositoryProvider.of<ConnectivityService>(context),
          )..add(MainSuccessConnectionEvent()),
          child: MaterialApp(
            home: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                if (state is MainNoConnectionState) {
                  return const NoConnectionWidget();
                }
                if (state is MainSuccessConnectionState) {
                  return const HomeScreen();
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_ecommerce_internship/features/details/presentation/screens/details/widgets/details_info_section.dart';
import 'package:flutter_test_ecommerce_internship/features/details/presentation/screens/details/widgets/imagecard.dart';

import 'package:flutter_test_ecommerce_internship/features/details/presentation/screens/details/widgets/topbar.dart';
import 'package:flutter_test_ecommerce_internship/service_locator.dart';

import '../../../../../components/connectivity_service.dart';
import '../../../../../components/constants.dart';
import '../../../../../components/loading_widget.dart';
import '../../../../../components/no_connection_widget.dart';
import '../../../data/datasource/details_datasource.dart';
import '../../bloc/details_bloc.dart';
import '../../bloc/details_event.dart';
import '../../bloc/details_state.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sl = getIt.get<DetailsBloc>()..add(LoadDetailsEvent());
    return BlocProvider(
      create: (context) => sl,
      child: BlocBuilder<DetailsBloc, DetailsState>(builder: (context, state) {
        if (state is DetailsLoadingState) {
          return const LoadingWidget();
        }
        if (state is DetailsLoadedState) {
          return Scaffold(
            backgroundColor: bgColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const TopBarNavigation(),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 300,
                        child: PageView.builder(
                            onPageChanged: (index) {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            controller: PageController(viewportFraction: 0.6),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.loadedDetails!.images!.length,
                            itemBuilder: (context, index) {
                              var scale = _selectedIndex == index ? 1.0 : 0.8;
                              return TweenAnimationBuilder(
                                tween: Tween(begin: scale, end: scale),
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 350),
                                child: ImageCard(
                                    image: state.loadedDetails!.images![index]),
                                builder: (context, double value, child) {
                                  return Transform.scale(
                                    scale: value,
                                    child: child,
                                  );
                                },
                              );
                            }),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: const BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: Column(
                          children: [
                            DetailsInfoSection(
                              title: state.loadedDetails!.title!,
                              ssd: state.loadedDetails!.ssd!,
                              sd: state.loadedDetails!.sd!,
                              camera: state.loadedDetails!.camera!,
                              cpu: state.loadedDetails!.cpu!,
                              capacity: state.loadedDetails!.capacity,
                              color: state.loadedDetails!.color,
                              id: state.loadedDetails!.id!,
                              isFavorite: state.loadedDetails!.isFavorites!,
                              price: state.loadedDetails!.price!.toString(),
                              rating: state.loadedDetails!.rating!,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      }),
    );
  }
}

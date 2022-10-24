import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_ecommerce_internship/components/bottom_navigation_bar.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';
import 'package:flutter_test_ecommerce_internship/components/loading_widget.dart';
import 'package:flutter_test_ecommerce_internship/features/home/presentation/screens/home/widgets/bestseller_card.dart';

import 'package:flutter_test_ecommerce_internship/features/home/presentation/screens/home/widgets/bestseller_title.dart';
import 'package:flutter_test_ecommerce_internship/features/home/presentation/screens/home/widgets/category_title.dart';
import 'package:flutter_test_ecommerce_internship/features/home/presentation/screens/home/widgets/category_selection.dart';
import 'package:flutter_test_ecommerce_internship/features/home/presentation/screens/home/widgets/filter_geo.dart';
import 'package:flutter_test_ecommerce_internship/features/home/presentation/screens/home/widgets/hotsales_card.dart';

import 'package:flutter_test_ecommerce_internship/features/home/presentation/screens/home/widgets/hotsales_title.dart';

import 'package:flutter_test_ecommerce_internship/features/home/presentation/screens/home/widgets/search_section.dart';
import 'package:flutter_test_ecommerce_internship/service_locator.dart';

import '../../../../details/presentation/screens/details/details_screen.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_events.dart';
import '../../bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sl = getIt.get<HomeBloc>()..add(LoadHomeEvent());
    return BlocProvider(
      create: (context) => sl,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: ((context, state) {
          if (state is HomeLoadingState) {
            return const LoadingWidget();
          }
          if (state is HomeLoadedState) {
            return Scaffold(
              bottomNavigationBar: CustomNavigationBar(),
              backgroundColor: bgColor,
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FilterGeo(),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          const SizedBox(height: 12),
                          const SelectCategoryTitle(),
                          const SizedBox(height: 18),
                          const CategoryWidget(),
                          const SizedBox(height: 18),
                          const SearchSection(),
                          const SizedBox(height: 18),
                          const HotSalesTitle(),
                          const SizedBox(height: 18),
                          SizedBox(
                            height: 182,
                            child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.loadedHotSales!.length,
                                itemBuilder: (context, index) {
                                  return HotSalesCard(
                                    title: state.loadedHotSales![index].title,
                                    isNew: state.loadedHotSales![index].isNew,
                                    picture:
                                        state.loadedHotSales![index].picture,
                                    subtitle:
                                        state.loadedHotSales![index].subtitle,
                                  );
                                }),
                          ),
                          const SizedBox(height: 18),
                          const BestSellerTitle(),
                          const SizedBox(height: 18),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 22),
                            child: SizedBox(
                              height: 500,
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: state.loadedBestSeller!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.8,
                                        crossAxisSpacing: 12,
                                        mainAxisSpacing: 12),
                                itemBuilder: (context, index) {
                                  return BestSellerCard(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DetailsScreen())),
                                      title:
                                          state.loadedBestSeller![index].title,
                                      isFavorites: state
                                          .loadedBestSeller![index].isFavorites,
                                      picture: state
                                          .loadedBestSeller![index].picture,
                                      discountPrice: state
                                          .loadedBestSeller![index]
                                          .discountPrice,
                                      priceWithoutDiscount: state
                                          .loadedBestSeller![index]
                                          .priceWithoutDiscount);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }
}

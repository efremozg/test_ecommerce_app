import '../models/home_model.dart';

abstract class HomeRepository {
  Future<List<HomeStore>> getHotSales();

  Future<List<BestSeller>> getBestSeller();
}

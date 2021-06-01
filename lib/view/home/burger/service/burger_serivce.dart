import 'package:vexana/vexana.dart';

import '../../../_product/_mixin/network_helper.dart';
import '../../../_product/_utilty/burger_network_enum.dart';
import '../model/burger_model.dart';

abstract class IBurgerService {
  final INetworkManager manager;

  IBurgerService(this.manager);

  Future<List<BurgerModel>> fetchFavoriteBurgers();

  Future<List<BurgerModel>> fetchBurgersLimited({double? max = 50, double? min = 0});
  Future<List<BurgerModel>> fetchBurgersSorted({required BurgerSortValues sort, BurgerSortValuesType types = BurgerSortValuesType.ASC});
}

class BurgerService extends IBurgerService with NetworkHelper {
  BurgerService(INetworkManager manager) : super(manager);

  @override
  Future<List<BurgerModel>> fetchBurgersLimited({double? max = 50, double? min = 0}) async {
    final response = await manager.send<BurgerModel, List<BurgerModel>>(BurgerNetworkPath.PRICE.rawValue,
        parseModel: BurgerModel(),
        method: RequestType.GET,
        queryParameters: Map.fromEntries([BurgerQueryParamaters.MIN.rawValue(min?.toInt()), BurgerQueryParamaters.MAX.rawValue(max?.toInt())]));

    return response.data ?? [];
  }

  @override
  Future<List<BurgerModel>> fetchBurgersSorted({required BurgerSortValues sort, BurgerSortValuesType types = BurgerSortValuesType.ASC}) async {
    final response = await manager.send<BurgerModel, List<BurgerModel>>(BurgerNetworkPath.MAIN.rawValue,
        parseModel: BurgerModel(),
        method: RequestType.GET,
        queryParameters:
            Map.fromEntries([BurgerQueryParamaters.SORT.rawValue(sort.rawValue), BurgerQueryParamaters.SORT_TYPE.rawValue(types.rawValue)]));

    return response.data ?? [];
  }

  @override
  Future<List<BurgerModel>> fetchFavoriteBurgers() async {
    final response = await manager.send<BurgerModel, List<BurgerModel>>(BurgerNetworkPath.MAIN.rawValue,
        parseModel: BurgerModel(), method: RequestType.GET, queryParameters: Map.fromEntries([BurgerQueryParamaters.FAVORITE.rawValue(true)]));
    showLog(response);
    return response.data ?? [];
  }
}

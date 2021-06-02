import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/view/_product/_utilty/burger_network_enum.dart';
import 'package:fluttermvvmtemplate/view/home/burger/service/burger_serivce.dart';

void main() {
  IBurgerService? burgerService;
  setUp(() {
    burgerService = BurgerService(VexanaManager.instance.networkManager);
  });
  test('Fetch favorite Burgers', () async {
    final response = await burgerService?.fetchFavoriteBurgers();

    expect(response, isNotEmpty);
  });

  test('Fetch min 20 max 30 service', () async {
    final response = await burgerService?.fetchBurgersLimited(min: 20, max: 30);

    expect(response, isNotEmpty);
  });

  test('Fetch sort rate', () async {
    final response = await burgerService?.fetchBurgersSorted(sort: BurgerSortValues.RATES);

    expect(response, isNotEmpty);
  });
}

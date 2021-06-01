enum BurgerSortValues { NAME, PRICE, RATES, UPDATED }
enum BurgerSortValuesType { ASC, DSC }

enum BurgerNetworkPath { MAIN, PRICE }
enum BurgerQueryParamaters { FAVORITE, SORT, SORT_TYPE, MIN, MAX }

extension BurgerSortValuesExtension on BurgerSortValues {
  String get rawValue {
    switch (this) {
      case BurgerSortValues.NAME:
        return 'name';
      case BurgerSortValues.PRICE:
        return 'price';
      case BurgerSortValues.RATES:
        return 'rates';
      case BurgerSortValues.UPDATED:
        return 'updated';
    }
  }
}

extension BurgerSortValuesTypeExtension on BurgerSortValuesType {
  int get rawValue {
    switch (this) {
      case BurgerSortValuesType.ASC:
        return -1;
      case BurgerSortValuesType.DSC:
        return 1;
    }
  }
}

extension BurgerNetworkPathExtension on BurgerNetworkPath {
  String get rawValue {
    switch (this) {
      case BurgerNetworkPath.MAIN:
        return 'burgers';
      case BurgerNetworkPath.PRICE:
        return 'burgers/price';
    }
  }
}

extension BurgerQueryParamatersExtension on BurgerQueryParamaters {
  MapEntry<String, dynamic> rawValue(dynamic value) {
    switch (this) {
      case BurgerQueryParamaters.FAVORITE:
        return MapEntry('isFavorite', value);
      case BurgerQueryParamaters.SORT:
        return MapEntry('sort', value);
      case BurgerQueryParamaters.SORT_TYPE:
        return MapEntry('sortType', value);
      case BurgerQueryParamaters.MIN:
        return MapEntry('min', value);
      case BurgerQueryParamaters.MAX:
        return MapEntry('max', value);
    }
  }
}

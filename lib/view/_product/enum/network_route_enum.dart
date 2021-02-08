enum NetworkRoutes { LOGIN, BUILD_HOME, FRIENDS }

extension NetwrokRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return 'login';
      case NetworkRoutes.BUILD_HOME:
        return 'house';
      case NetworkRoutes.FRIENDS:
        return 'friends';
      default:
        throw Exception('Routes Not FouND');
    }
  }
}

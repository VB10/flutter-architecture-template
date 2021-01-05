enum NetworkRoutes { LOGIN, BUILD_HOME }

extension NetwrokRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return "login";
      case NetworkRoutes.BUILD_HOME:
        return "house";
      default:
        throw Exception("Routes Not FouND");
    }
  }
}

enum NetworkRoutes { LOGIN }

extension NetwrokRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return "login";
      default:
        throw Exception("Routes Not FouND");
    }
  }
}

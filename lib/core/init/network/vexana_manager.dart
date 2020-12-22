import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager _instace;
  static VexanaManager get instance {
    if (_instace == null) _instace = VexanaManager._init();
    return _instace;
  }

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: "http://localhost:3000/"));
}

import 'package:vexana/vexana.dart';

import '../model/login_model.dart';
import '../model/login_response_model.dart';

abstract class ILoginService {
  final INetworkManager manager;

  ILoginService(this.manager);

  Future<LoginResponseModel> fetchUserControl(LoginModel model);
}

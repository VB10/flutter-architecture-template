import 'package:vexana/vexana.dart';

import '../../../_product/enum/network_route_enum.dart';
import '../model/login_model.dart';
import '../model/login_response_model.dart';
import 'ILoginService.dart';

class LoginService extends ILoginService {
  LoginService(INetworkManager manager) : super(manager);

  @override
  Future<LoginResponseModel> fetchUserControl(LoginModel model) async {
    final response = await manager.fetch<LoginResponseModel, LoginResponseModel>(NetworkRoutes.LOGIN.rawValue,
        parseModel: LoginResponseModel(), method: RequestType.POST, data: model);

    if (response.data is LoginResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}

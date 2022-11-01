import 'package:fluttermvvmtemplate/view/_product/enum/network_route_enum.dart';
import 'package:fluttermvvmtemplate/view/authenticate/login/model/login_model.dart';
import 'package:fluttermvvmtemplate/view/authenticate/login/model/login_response_model.dart';
import 'package:fluttermvvmtemplate/view/authenticate/login/service/ILoginService.dart';
import 'package:vexana/vexana.dart';

class LoginService extends ILoginService {
  LoginService(INetworkManager manager) : super(manager);

  @override
  Future<LoginResponseModel?> fetchUserControl(LoginModel model) async {
    final response = await manager.send<LoginResponseModel, LoginResponseModel>(NetworkRoutes.LOGIN.rawValue,
        parseModel: LoginResponseModel(), method: RequestType.POST, data: model,);

    if (response.data is LoginResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}

// BEFORE: null safety before
// @override
// Future<LoginResponseModel> fetchUserControl(LoginModel model) async {
//   final response = await manager.fetch<LoginResponseModel, LoginResponseModel>(NetworkRoutes.LOGIN.rawValue,
//       parseModel: LoginResponseModel(), method: RequestType.POST, data: model);

//   if (response.data is LoginResponseModel) {
//     return response.data;
//   } else {
//     return null;
//   }
// }

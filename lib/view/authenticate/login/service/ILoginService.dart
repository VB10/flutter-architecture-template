import 'package:fluttermvvmtemplate/view/authenticate/login/model/login_model.dart';
import 'package:fluttermvvmtemplate/view/authenticate/login/model/login_response_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {

  ILoginService(this.manager);
  final INetworkManager manager;

  Future<LoginResponseModel?> fetchUserControl(LoginModel model);
}

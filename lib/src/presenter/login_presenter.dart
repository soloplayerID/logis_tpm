// ignore_for_file: avoid_print
import '../model/login_model.dart';
import '../resources/session.dart';
import '../resources/userApi.dart';
import '../state/login_state.dart';
import 'package:get_storage/get_storage.dart';
import '../../helper/getStorage.dart' as constants;

abstract class LoginPresenterAbstract {
  set view(LoginState view) {}
  void loginClicked() {}
}

class LoginPresenter implements LoginPresenterAbstract {
  final LoginModel _loginModel = LoginModel();
  late LoginState _loginState;
  final UserApi _userApi = UserApi();

  @override
  void loginClicked() {
    _loginModel.isloading = true;
    _loginState.refreshData(_loginModel);
    _userApi
        .connectToApi(
            _loginModel.username.text.trim(), _loginModel.password.text.trim())
        .then((value) async {
      await GetStorage().write(constants.idUser, value.data!.idUser);
      await GetStorage().write(constants.idPosition, value.data!.role);
      await GetStorage().write(constants.namaUser, value.data!.username);
      await GetStorage().write(constants.idWarehouse, value.data!.region);
      print('===${value.data!.idUser}');
      Session.setId(value.data!.idUser.toString());
      Session.setName(value.data!.username.toString());
      Session.setIdWh(value.data!.region.toString());
      Session.setIdPosition(value.data!.role.toString());
      _loginModel.isloading = false;
      _loginState.refreshData(_loginModel);
      _loginState.onSuccess("yey, Berhasil :D");
    }).catchError((onError) {
      print(onError);
      _loginModel.isloading = false;
      _loginState.refreshData(_loginModel);
      _loginState.onError(onError);
    });
  }

  @override
  set view(LoginState view) {
    // ignore: todo
    // TODO: implement view
    _loginState = view;
    _loginState.refreshData(_loginModel);
  }
}

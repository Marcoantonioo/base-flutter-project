import 'package:base_flutter_project/architecture/controller/controller.dart';
import 'package:base_flutter_project/presentation/screens/login/login_event.dart';
import 'package:base_flutter_project/presentation/screens/login/login_provider.dart';
import 'package:base_flutter_project/presentation/screens/login/model/credential_model.dart';
import 'package:get/get.dart';

class LoginController extends BaseController<LoginEvent> {
  final LoginProvider _provider;

  late RxString email;
  late RxString password;

  LoginController({
    required LoginProvider loginProvider,
  }) : _provider = loginProvider;

  @override
  void onInit() {
    super.onInit();
    _handleOnInit();
  }

  @override
  void handleEvents(LoginEvent? event) {
    if (event is DoLogin) {
      _handleLogin();
    }
  }

  Future<void> _handleLogin() async {
    doOnlineAction(action: () async {
      final res = await _provider.login(_buildEntity());
      showSuccess(res);
    });
  }

  CredentialModel _buildEntity() =>
      CredentialModel(email: email.value, password: password.value);

  void _handleOnInit() {
    email = "".obs;
    password = "".obs;
  }
}

import 'package:cebras_app/architecture/controller/controller.dart';
import 'package:cebras_app/architecture/utils/validators.dart';
import 'package:cebras_app/presentation/screens/login/login_event.dart';
import 'package:cebras_app/presentation/screens/login/login_provider.dart';
import 'package:cebras_app/presentation/screens/login/model/credential_model.dart';
import 'package:get/get.dart';

class LoginController extends BaseController<LoginEvent> {
  final LoginProvider _provider;

  late RxString email;
  late RxBool hasErrorEmail;
  late RxString password;
  late RxBool hasErrorPassword;

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
    if (isValid()) {
      doOnlineAction(action: () async {
        final res = await _provider.login(_buildEntity());
        showSuccess(res);
      });
    }
  }

  bool isValid() {
    hasErrorEmail(false);
    hasErrorPassword(false);
    if (email.isEmpty || !Validator.isEmail(email.value)) {
      hasErrorEmail(true);
    }

    if (password.isEmpty || password.value.length < 8) {
      hasErrorPassword(true);
    }
    return hasErrorEmail.isFalse && hasErrorPassword.isFalse;
  }

  CredentialModel _buildEntity() =>
      CredentialModel(email: email.value, password: password.value);

  void _handleOnInit() {
    email = "".obs;
    password = "".obs;
    dispatchEvent(GetDeviceInfo());
    hasErrorEmail = false.obs;
    hasErrorPassword = false.obs;
  }
}

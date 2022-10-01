import 'package:cebras_app/architecture/controller/controller.dart';
import 'package:cebras_app/architecture/device_info/device_info.dart';
import 'package:cebras_app/architecture/device_info/model/device_info_model.dart';
import 'package:cebras_app/presentation/screens/login/login_event.dart';
import 'package:cebras_app/presentation/screens/login/login_provider.dart';
import 'package:cebras_app/presentation/screens/login/model/credential_model.dart';
import 'package:get/get.dart';

class LoginController extends BaseController<LoginEvent> {
  final LoginProvider _provider;
  final DeviceInfo _deviceInfo;

  late RxString email;
  late RxString password;
  late Rx<DeviceInfoModel> deviceInfo;

  LoginController({
    required LoginProvider loginProvider,
    required DeviceInfo deviceInfo,
  })  : _provider = loginProvider,
        _deviceInfo = deviceInfo;

  @override
  void onInit() {
    super.onInit();
    _handleOnInit();
  }

  @override
  void handleEvents(LoginEvent? event) {
    if (event is DoLogin) {
      _handleLogin();
    } else if (event is GetDeviceInfo) {
      _handleGetDeviceInfo();
    }
  }

  Future<void> _handleLogin() async {
    doOnlineAction(action: () async {
      final res = await _provider.login(_buildEntity());
      showSuccess(res);
    });
  }

  Future<void> _handleGetDeviceInfo() async {
    //setStateLoading();
    deviceInfo.value = await _deviceInfo.getDeviceInfo();
    //setStateIdle();
  }

  CredentialModel _buildEntity() =>
      CredentialModel(email: email.value, password: password.value);

  void _handleOnInit() {
    email = "".obs;
    password = "".obs;
    deviceInfo =
        DeviceInfoModel(identifier: '', model: '', manufacturer: '').obs;
    dispatchEvent(GetDeviceInfo());
  }
}

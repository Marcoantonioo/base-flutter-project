import 'package:cebras_app/architecture/controller/controller.dart';
import 'package:cebras_app/architecture/utils/validators.dart';
import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_event.dart';
import 'package:cebras_app/presentation/screens/forgot_password/forgot_password_provider.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends BaseController<ForgotPasswordEvent> {
  final ForgotPasswordProvider _provider;

  ForgotPasswordController({required ForgotPasswordProvider provider})
      : _provider = provider;

  late RxInt step;
  late RxString optCode;

  late RxString email;
  late RxBool hasErrorEmail;

  late RxString password;
  late RxBool hasErrorPassword;
  @override
  void onInit() {
    step = 0.obs;
    optCode = "".obs;
    email = "".obs;
    hasErrorEmail = false.obs;
    password = "".obs;
    hasErrorPassword = false.obs;
    super.onInit();
  }

  @override
  void handleEvents(ForgotPasswordEvent? event) {
    if (event is NextStep) {
      _onNextStep();
    } else if (event is PreviousStep) {
      _onPrevioustStep();
    }
  }

  void _onNextStep() {
    final currentStep = step.value;
    if (currentStep == 0) {
      _validStepOne();
    } else if (currentStep == 1) {
      _validStepTwo();
    } else {
      _validStepThree();
    }
  }

  Future<void> _validStepOne() async {
    hasErrorEmail(false);
    if (email.isEmpty || !Validator.isEmail(email.value)) {
      hasErrorEmail(true);
      return;
    } else {
      doOnlineAction(action: () async {
        final res = await _provider.sendEmail(email.value);
        if (res) {
          step.value = step.value + 1;
        } else {
          showFailure('Não foi possível enviar o email, tente novamente');
        }
      });
    }
  }

  Future<void> _validStepTwo() async {
    if (optCode.isEmpty || optCode.value.length != 4) {
      showFailure('Digite um código válido!');
      return;
    } else {
      doOnlineAction(action: () async {
        final res =
            await _provider.checkVerificationCode(optCode.value, email.value);
        if (res) {
          step.value = step.value + 1;
        } else {
          showFailure('Código inválido');
        }
      });
    }
  }

  Future<void> _validStepThree() async {
    hasErrorPassword(false);
    if (password.isEmpty || password.value.length < 8) {
      hasErrorPassword(true);
      return;
    } else {
      doOnlineAction(action: () async {
        final res = await _provider.changePassword(password.value, email.value);
        if (res) {
          pop();
          showSuccess('Senha alterada com sucesso.');
        } else {
          showFailure('Não foi possível alterar sua senha');
        }
      });
    }
  }

  void _onPrevioustStep() {
    final currentStep = step.value;
    if (currentStep == 0) {
      pop();
    } else {
      step--;
    }
  }
}

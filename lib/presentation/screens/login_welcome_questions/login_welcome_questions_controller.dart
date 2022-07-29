import 'package:cebras_app/architecture/controller/controller.dart';
import 'package:cebras_app/architecture/utils/dialogs.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_event.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/login_welcome_questions_provider.dart';
import 'package:cebras_app/presentation/screens/login_welcome_questions/model/chronic_disease_model.dart';
import 'package:cebras_app/routes/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginWelcomeQuestionsController
    extends BaseController<LoginWelcomeQuestionsEvent> {
  final LoginWelcomeQuestionsProvider _provider;

  LoginWelcomeQuestionsController(
      {required LoginWelcomeQuestionsProvider provider})
      : _provider = provider;

  late RxBool isTermsAcepts;
  late RxInt step;

  ///weight
  late RxString weight;
  late RxBool hasErrorWeight;

  ///height
  late RxString height;
  late RxBool hasErrorHeight;

  ///chronic diseases
  late RxList<ChronicDiseaseModel> chronicDiseases;
  late RxList<ChronicDiseaseModel> chronicDiseasesSelecteds;

  ///smoker
  late RxBool isSmoker;
  late RxBool noSmoker;

  ///password
  late RxString password;
  late RxBool hasErrorPassword;

  @override
  void onInit() {
    step = 1.obs;
    weight = "".obs;
    height = "".obs;
    password = "".obs;
    isTermsAcepts = false.obs;
    hasErrorWeight = false.obs;
    hasErrorHeight = false.obs;
    hasErrorPassword = false.obs;
    isSmoker = false.obs;
    noSmoker = false.obs;
    chronicDiseases = RxList.empty();
    chronicDiseasesSelecteds = RxList.empty();
    _fetchChronicDiseaseLists();
    super.onInit();
  }

  @override
  void handleEvents(LoginWelcomeQuestionsEvent? event) {
    if (event is Start) {
      _onStartTapped((event).context);
    } else if (event is NextStep) {
      _onNextStep();
    } else if (event is PreviousStep) {
      _onPrevioustStep();
    }
  }

  Future<void> _onStartTapped(BuildContext context) async {
    showTermsOfUseDialog(
      context,
      isTermsAcepts,
      () {
        pop();
        toNamed(RouteName.loginWelcomeQuestions);
      },
    );
  }

  void _onPrevioustStep() {
    final currentStep = step.value;
    if (currentStep == 1) {
      pop();
    } else {
      step--;
    }
  }

  void _onNextStep() {
    final currentStep = step.value;
    if (currentStep == 1) {
      _validStepOne();
    } else if (currentStep == 2) {
      _validStepTwo();
    } else {
      _validStepThree();
    }
  }

  Future<void> _validStepOne() async {
    hasErrorWeight(false);
    hasErrorHeight(false);
    if (weight.isEmpty) {
      hasErrorWeight(true);
    }
    if (height.isEmpty) {
      hasErrorHeight(true);
    }

    if (height.isNotEmpty && weight.isNotEmpty) {
      step++;
    }
  }

  Future<void> _validStepTwo() async {
    doOnlineAction(
      action: () async {
        await Future.delayed(const Duration(seconds: 2));
        showScoreDialod(
          () {
            step++;
          },
        );
      },
    );
  }

  Future<void> _validStepThree() async {
    hasErrorPassword(false);
    if (password.isEmpty || password.value.length < 8) {
      hasErrorPassword(true);
      return;
    }
    doOnlineAction(
      action: () async {
        await Future.delayed(const Duration(seconds: 2));
        showSuccess('Feito');
      },
    );
  }

  void _fetchChronicDiseaseLists() {
    var list = [
      ChronicDiseaseModel(id: 1, title: 'Diabetes'),
      ChronicDiseaseModel(id: 2, title: 'Asma'),
      ChronicDiseaseModel(id: 3, title: 'Doença Pulmonar Obstrutiva Crônica'),
      ChronicDiseaseModel(id: 4, title: 'Acidente Vascular Cerebral (AVC)'),
      ChronicDiseaseModel(id: 5, title: 'Hipertensão Arterial'),
      ChronicDiseaseModel(id: 6, title: 'Câncer'),
      ChronicDiseaseModel(id: 7, title: 'Obesidade'),
    ];
    chronicDiseases(list);
  }

  void addChronicDisease(ChronicDiseaseModel entity) {
    chronicDiseasesSelecteds.add(entity);
  }

  void removeChronicDisease(ChronicDiseaseModel entity) {
    if (chronicDiseasesSelecteds.contains(entity)) {
      chronicDiseasesSelecteds.remove(entity);
    }
  }
}

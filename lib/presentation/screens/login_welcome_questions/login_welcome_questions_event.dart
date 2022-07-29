import 'package:flutter/cupertino.dart';

abstract class LoginWelcomeQuestionsEvent {
  LoginWelcomeQuestionsEvent();
}

class Start extends LoginWelcomeQuestionsEvent {
  final BuildContext context;
  Start({required this.context});
  @override
  String toString() => 'checking login';
}

class NextStep  extends LoginWelcomeQuestionsEvent {
  @override
  String toString() => 'Next step';
}

class PreviousStep  extends LoginWelcomeQuestionsEvent {
  @override
  String toString() => 'Previous step';
}


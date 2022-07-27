abstract class ForgotPasswordEvent {
  ForgotPasswordEvent();
}

class NextStep extends ForgotPasswordEvent {
  @override
  String toString() => 'Next step';
}

class PreviousStep extends ForgotPasswordEvent {
  @override
  String toString() => 'Previous step';
}

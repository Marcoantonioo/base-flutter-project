import 'package:base_flutter_project/architecture/injection/injector.dart';

class ComponentsInjector extends Injector {
  @override
  void dependencies() {
    // Não descomentar, injetado no [AppStateComponent]
    // AppStateComponentBinding().dependencies();
  }
}

import 'package:base_flutter_project/architecture/architecture_di.dart';
import 'package:base_flutter_project/architecture/injection/injector.dart';
import 'package:base_flutter_project/core/core_di.dart';
import 'package:base_flutter_project/presentation/presentation_injector.dart';

class AppInjector extends Injector {
  @override
  void dependencies() {
    ArchitectureInjector().dependencies();
    CoreInjector().dependencies();
    PresentationInjector().dependencies();
  }
}

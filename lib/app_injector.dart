import 'package:base_flutter_project/architecture/architecture_di.dart';
import 'package:base_flutter_project/architecture/injection/injector.dart';
import 'package:base_flutter_project/components/components_di.dart';
import 'package:base_flutter_project/core/core_di.dart';
import 'package:base_flutter_project/presentation/presentation_injector.dart';

class AppInjector extends Injector {
  @override
  void dependencies() {
    ArchitectureInjector().dependencies();
    ComponentsInjector().dependencies();
    CoreInjector().dependencies();
    PresentationInjector().dependencies();
  }
}

import 'package:cebras_app/architecture/architecture_di.dart';
import 'package:cebras_app/architecture/injection/injector.dart';
import 'package:cebras_app/components/components_di.dart';
import 'package:cebras_app/core/core_di.dart';

class AppInjector extends Injector {
  @override
  void dependencies() {
    ArchitectureInjector().dependencies();
    ComponentsInjector().dependencies();
    CoreInjector().dependencies();
  }
}

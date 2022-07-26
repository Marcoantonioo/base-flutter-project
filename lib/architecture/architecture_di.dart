import 'package:cebras_app/architecture/device_info/device_info.dart';
import 'package:cebras_app/architecture/device_info/device_info_impl.dart';
import 'package:cebras_app/architecture/injection/injector.dart';

class ArchitectureInjector extends Injector {
  @override
  void dependencies() {
    put<DeviceInfo>(DeviceInfoImpl(), permanent: true);
  }
}

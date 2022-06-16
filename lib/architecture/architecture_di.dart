import 'package:base_flutter_project/architecture/device_info/device_info.dart';
import 'package:base_flutter_project/architecture/device_info/device_info_impl.dart';
import 'package:base_flutter_project/architecture/injection/injector.dart';

class ArchitectureInjector extends Injector {
  @override
  void dependencies() {
    put<DeviceInfo>(DeviceInfoImpl(), permanent: true);
  }
}

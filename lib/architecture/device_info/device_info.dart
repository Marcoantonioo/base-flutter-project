import 'package:base_flutter_project/architecture/device_info/model/device_info_model.dart';

abstract class DeviceInfo {
  Future<DeviceInfoModel> getDeviceInfo();
}

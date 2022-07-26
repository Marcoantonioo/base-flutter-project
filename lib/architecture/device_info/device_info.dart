import 'package:cebras_app/architecture/device_info/model/device_info_model.dart';

abstract class DeviceInfo {
  Future<DeviceInfoModel> getDeviceInfo();
}

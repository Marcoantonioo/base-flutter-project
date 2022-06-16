import 'dart:developer';
import 'dart:io';

import 'package:advertising_id/advertising_id.dart';
import 'package:base_flutter_project/architecture/device_info/device_info.dart';
import 'package:base_flutter_project/architecture/device_info/model/device_info_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:unique_identifier/unique_identifier.dart';

class DeviceInfoImpl implements DeviceInfo {
  final DeviceInfoPlugin _instance = DeviceInfoPlugin();
  final int _sdkAndroidV10 = 29;
  String? _idfa;

  @override
  Future<DeviceInfoModel> getDeviceInfo() async {
    _idfa = await _tryGetAdvertisingId();

    if (Platform.isAndroid) {
      return _getAndroidDeviceInfo();
    } else {
      return _getIosDeviceInfo();
    }
  }

  Future<DeviceInfoModel> _getAndroidDeviceInfo() async {
    AndroidDeviceInfo androidInfo = await _instance.androidInfo;
    String? imei;

    /// Baseado no SDK, verifica a versão do Android
    /// Se for menor que 29 (dispositivos inferior a Android 10)
    /// irá pegar o IMEI
    int sdkInt = androidInfo.version.sdkInt ?? 0;
    if (sdkInt < _sdkAndroidV10) {
      imei = await UniqueIdentifier.serial;
    }
    return DeviceInfoModel(
      identifier: _idfa ?? imei,
      model: androidInfo.model!.toUpperCase(),
      manufacturer: androidInfo.manufacturer!.toUpperCase(),
    );
  }

  Future<DeviceInfoModel> _getIosDeviceInfo() async {
    IosDeviceInfo iosInfo = await _instance.iosInfo;
    return DeviceInfoModel(
      identifier: _idfa,
      model: iosInfo.model!.toUpperCase(),
      manufacturer: "Apple".toUpperCase(),
    );
  }

  Future<String?> _tryGetAdvertisingId() async {
    try {
      return await AdvertisingId.id(true);
    } on PlatformException {
      log('Erro ao tentar buscar o AdvertisingId');
      return null;
    }
  }
}

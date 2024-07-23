import 'package:flutter/material.dart';

import 'log.dart';

enum DeviceType { phone, tablet, other }

class DeviceService {
  static late DeviceType _deviceType;
  static late Size _size;
  static bool isInit = false;

  static void init(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _initDeviceType();
    isInit = true;
  }

  static void _initDeviceType() {
    LogService.logLn('Initialize device type...');
    if (_size.shortestSide < 600) {
      _deviceType = DeviceType.phone;
    } else if (_size.shortestSide >= 600 && _size.shortestSide < 1400) {
      _deviceType = DeviceType.tablet;
    } else {
      _deviceType = DeviceType.other;
    }
    LogService.logLn('DeviceType: $_deviceType');
  }

  static DeviceType get deviceType => _deviceType;
  static Size get size => _size;
  static bool get isTablet => _deviceType == DeviceType.tablet;
}

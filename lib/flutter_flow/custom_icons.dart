import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _myFlutterAppFamily = 'MyFlutterApp';
  static const String _pinFamily = 'Pin';
  static const String _progressFamily = 'Progress';

  // MyFlutterApp
  static const IconData kmegaphone =
      IconData(0xe800, fontFamily: _myFlutterAppFamily);

  // Pin
  static const IconData kinfoCircled = IconData(0xe801, fontFamily: _pinFamily);
  static const IconData kpin = IconData(0xf304, fontFamily: _pinFamily);

  // Progress
  static const IconData kspin6 = IconData(0xe839, fontFamily: _progressFamily);
}

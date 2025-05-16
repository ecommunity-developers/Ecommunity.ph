import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _CenroDisplayName =
          prefs.getString('ff_CenroDisplayName') ?? _CenroDisplayName;
    });
    _safeInit(() {
      _CenroProfilePic =
          prefs.getString('ff_CenroProfilePic') ?? _CenroProfilePic;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _switchTo = 'Resident';
  String get switchTo => _switchTo;
  set switchTo(String value) {
    _switchTo = value;
  }

  DocumentReference? _junkshopID;
  DocumentReference? get junkshopID => _junkshopID;
  set junkshopID(DocumentReference? value) {
    _junkshopID = value;
  }

  String _CenroDisplayName = 'CENRO Baliwag';
  String get CenroDisplayName => _CenroDisplayName;
  set CenroDisplayName(String value) {
    _CenroDisplayName = value;
    prefs.setString('ff_CenroDisplayName', value);
  }

  String _CenroProfilePic =
      'https://firebasestorage.googleapis.com/v0/b/ecommunity-awspik.appspot.com/o/cenro.png?alt=media&token=2c89ca8d-dedd-49a7-9bb0-f3fc94788f35';
  String get CenroProfilePic => _CenroProfilePic;
  set CenroProfilePic(String value) {
    _CenroProfilePic = value;
    prefs.setString('ff_CenroProfilePic', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

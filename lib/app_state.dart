import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _iHavePurchaseHistory =
          prefs.getBool('ff_iHavePurchaseHistory') ?? _iHavePurchaseHistory;
    });
    _safeInit(() {
      _signedIn = prefs.getBool('ff_signedIn') ?? _signedIn;
    });
    _safeInit(() {
      _onboarded = prefs.getBool('ff_onboarded') ?? _onboarded;
    });
    _safeInit(() {
      _notificationsAccepted =
          prefs.getBool('ff_notificationsAccepted') ?? _notificationsAccepted;
    });
    _safeInit(() {
      _accountDetailsSet =
          prefs.getBool('ff_accountDetailsSet') ?? _accountDetailsSet;
    });
    _safeInit(() {
      _locationAccepted =
          prefs.getBool('ff_locationAccepted') ?? _locationAccepted;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _iHavePurchaseHistory = false;
  bool get iHavePurchaseHistory => _iHavePurchaseHistory;
  set iHavePurchaseHistory(bool _value) {
    _iHavePurchaseHistory = _value;
    prefs.setBool('ff_iHavePurchaseHistory', _value);
  }

  bool _signedIn = false;
  bool get signedIn => _signedIn;
  set signedIn(bool _value) {
    _signedIn = _value;
    prefs.setBool('ff_signedIn', _value);
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool _value) {
    _searchActive = _value;
  }

  bool _onboarded = false;
  bool get onboarded => _onboarded;
  set onboarded(bool _value) {
    _onboarded = _value;
    prefs.setBool('ff_onboarded', _value);
  }

  bool _notificationsAccepted = false;
  bool get notificationsAccepted => _notificationsAccepted;
  set notificationsAccepted(bool _value) {
    _notificationsAccepted = _value;
    prefs.setBool('ff_notificationsAccepted', _value);
  }

  bool _accountDetailsSet = false;
  bool get accountDetailsSet => _accountDetailsSet;
  set accountDetailsSet(bool _value) {
    _accountDetailsSet = _value;
    prefs.setBool('ff_accountDetailsSet', _value);
  }

  bool _locationAccepted = false;
  bool get locationAccepted => _locationAccepted;
  set locationAccepted(bool _value) {
    _locationAccepted = _value;
    prefs.setBool('ff_locationAccepted', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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

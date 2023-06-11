import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
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

  final _srchQryManager = FutureRequestManager<List<ProviderDocumentsRecord>>();
  Future<List<ProviderDocumentsRecord>> srchQry({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProviderDocumentsRecord>> Function() requestFn,
  }) =>
      _srchQryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSrchQryCache() => _srchQryManager.clear();
  void clearSrchQryCacheKey(String? uniqueKey) =>
      _srchQryManager.clearRequest(uniqueKey);
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

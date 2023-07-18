import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/services_screen.png',
            fit: BoxFit.fitHeight,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'inkonzoSplashDark': ParameterData.none(),
  'login_page': ParameterData.none(),
  'sign_up': ParameterData.none(),
  'chat_page': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'all_chats': ParameterData.none(),
  'settings': ParameterData.none(),
  'ProviderDetail': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'iDRef': getParameter<DocumentReference>(data, 'iDRef'),
        },
      ),
  'UserSettings': ParameterData.none(),
  'BookingPage': (data) async => ParameterData(
        allParams: {
          'providerRef': getParameter<DocumentReference>(data, 'providerRef'),
          'bookingFee': getParameter<double>(data, 'bookingFee'),
        },
      ),
  'EditUserDetails': ParameterData.none(),
  'providerDashboard': ParameterData.none(),
  'serviceTrackingList': (data) async => ParameterData(
        allParams: {
          'userDoc': await getDocumentParameter<UsersRecord>(
              data, 'userDoc', UsersRecord.fromSnapshot),
        },
      ),
  'trackingDetail': (data) async => ParameterData(
        allParams: {
          'dealDoc': await getDocumentParameter<DealsRecord>(
              data, 'dealDoc', DealsRecord.fromSnapshot),
        },
      ),
  'CreateDetail': (data) async => ParameterData(
        allParams: {
          'imgURL': getParameter<String>(data, 'imgURL'),
        },
      ),
  'readDetail': (data) async => ParameterData(
        allParams: {
          'provDoc': await getDocumentParameter<AboutSectionRecord>(
              data, 'provDoc', AboutSectionRecord.fromSnapshot),
        },
      ),
  'UpdateDetail': (data) async => ParameterData(
        allParams: {
          'image': getParameter<String>(data, 'image'),
          'header': getParameter<String>(data, 'header'),
          'body': getParameter<String>(data, 'body'),
          'aboutReference':
              getParameter<DocumentReference>(data, 'aboutReference'),
        },
      ),
  'inkonzoSplashLite': ParameterData.none(),
  'TsAndCs': ParameterData.none(),
  'InkonzoOnboarding': ParameterData.none(),
  'ProviderRegister': ParameterData.none(),
  'SignUpAccount': ParameterData.none(),
  'homePageLanding': ParameterData.none(),
  'searchPageCopyd': (data) async => ParameterData(
        allParams: {
          'initialQuery': getParameter<String>(data, 'initialQuery'),
        },
      ),
  'ForgotPassword': ParameterData.none(),
  'ProviderDetailCopy': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'iDRef': getParameter<DocumentReference>(data, 'iDRef'),
        },
      ),
  'searchPage': (data) async => ParameterData(
        allParams: {
          'initialQuery': getParameter<String>(data, 'initialQuery'),
        },
      ),
  'searchPage2': (data) async => ParameterData(
        allParams: {
          'initialQuery': getParameter<String>(data, 'initialQuery'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

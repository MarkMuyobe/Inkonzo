import 'dart:io' show Platform;

import 'package:cloud_firestore/cloud_firestore.dart';

import 'serialization_util.dart';
import '../../auth/firebase_auth/auth_util.dart';
import '../cloud_functions/cloud_functions.dart';
import '../api_requests/api_calls.dart';

import 'package:flutter/foundation.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

export 'push_notifications_handler.dart';
export 'serialization_util.dart';

const kUserPushNotificationsCollectionName = 'ff_user_push_notifications';

class UserTokenInfo {
  const UserTokenInfo(this.userPath, this.fcmToken);
  final String userPath;
  final String fcmToken;
}

Stream<UserTokenInfo> getFcmTokenStream(String userPath) =>
    Stream.value(!kIsWeb && (Platform.isIOS || Platform.isAndroid))
         .where((shouldGetToken) => shouldGetToken)
        .asyncMap<String?>(
            (_) => FirebaseMessaging.instance.requestPermission().then(
                  (settings) => settings.authorizationStatus ==
                          AuthorizationStatus.authorized
                      ? FirebaseMessaging.instance.getToken()
                      : null,
                ))
        .switchMap((fcmToken) => Stream.value(fcmToken)
            .merge(FirebaseMessaging.instance.onTokenRefresh))
        .where((fcmToken) => fcmToken != null && fcmToken.isNotEmpty)
        .map((token) => UserTokenInfo(userPath, token!));

final fcmTokenUserStream = authenticatedUserStream
    .where((user) => user != null)
    .map((user) => user!.reference.path)
    .distinct()
    .switchMap(getFcmTokenStream)
    .map(
      (userTokenInfo) => makeCloudCall(
        'addFcmToken',
        {
          'userDocPath': userTokenInfo.userPath,
          'fcmToken': userTokenInfo.fcmToken,
          'deviceType': Platform.isIOS ? 'iOS' : 'Android',
        },
      ),
    );


Future<void> handleBackgroundMessage (RemoteMessage message)async{
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}


FirebaseMessaging messaging = FirebaseMessaging.instance;
void printFcmToken() async {
  String? fcmToken = await messaging.getToken();
  print('FCM Token: $fcmToken');
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Payload: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
}




void triggerPushNotification({
  required String? notificationTitle,
  required String? notificationText,
  String? notificationImageUrl,
  DateTime? scheduledTime,
  String? notificationSound,
  required List<DocumentReference> userRefs,
  required String initialPageName,
  required Map<String, dynamic> parameterData,
}) async {
  if ((notificationTitle ?? '').isEmpty || (notificationText ?? '').isEmpty) {
    return;
  }
  final serializedParameterData = serializeParameterData(parameterData);
  final pushNotificationData = {
    'notification_title': notificationTitle,
    'notification_text': notificationText,
    if (notificationImageUrl != null)
      'notification_image_url': notificationImageUrl,
    if (scheduledTime != null) 'scheduled_time': scheduledTime,
    if (notificationSound != null) 'notification_sound': notificationSound,
    'user_refs': userRefs.map((u) => u.path).join(','),
    'initial_page_name': initialPageName,
    'parameter_data': serializedParameterData,
    'sender': currentUserReference,
    'timestamp': DateTime.now(),
  };
  FirebaseFirestore.instance
      .collection(kUserPushNotificationsCollectionName)
      .doc()
      .set(pushNotificationData);

  final FrontEndNotifications notify = FrontEndNotifications();
  String? token = await messaging.getToken();
  notify.sendPushNotification(deviceToken: token, title: notificationTitle, body: notificationText);
}

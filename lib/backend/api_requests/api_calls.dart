import 'dart:convert';
import 'package:http/http.dart' as http;


import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class HeHePeeHayiCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'He He Pee Hayi',
      apiUrl: 'https://www.tryme.com',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FrontEndNotifications{

  String serverKey = 'AAAAPLsT-Vc:APA91bEhHAjLITn_Wo6Ee2ezMHaHwV4jp_mGuSXRtPRbDGE5tYAQPgQidc6hTmPRriqPlmsZBu716Ecl4cx68TGhP3zbSlRnYZ2p47R02d-xtcMxd24nfSEmG5FvUqj6G3JQ-OtktA7i';

  void sendPushNotification({
    required String? deviceToken,
    required String? title,
    required String? body,
  }) async {
    final url = 'https://fcm.googleapis.com/fcm/send';
    print('Token receiving Notification: ${deviceToken}');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    final Map<String, dynamic> data = {
      'notification': {
        'title': title,
        'body': body,
      },
      'priority': 'high',
      'to': deviceToken,
    };

    final String jsonData = jsonEncode(data);

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonData,
      );

      if (response.statusCode == 200) {
        print('Notification sent successfully');
      } else {
        print('Failed to send notification. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending notification: $e');
    }
  }
}



import 'package:bab_e_ilm/views/Homepage/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:bab_e_ilm/main.dart';
class NotificationHelper {
  static void handleNotificationTap(NotificationResponse response) {
    if (response.actionId == 'open_app') {
      navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } else if (response.actionId == 'dismiss') {
      // maybe just clear notif or do nothing
    } else {
      // default tap on notif
      navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    }
  }
}

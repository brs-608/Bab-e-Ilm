import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SetupNotifications {

static Future<void> setupFCM(String userId) async{
  debugPrint("hello this is working ..... \n ............ we're in set up FCM !!!.......................................\n..............................");
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    sound: true,
    badge: true
  );

  String? token = await messaging.getToken();
  debugPrint("yeh raha token burhan bhaiiiii!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! $token");
  if(token != null){
    debugPrint("yeh raha token burhan bhaiiiii!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! $token");
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set({"fcmToken" : token},SetOptions(merge: true));
  }else{
    debugPrint("yeh sab kia hogya , token nahi aaya!!!!!!!!!!!!!!!!!");
  }
  FirebaseMessaging.instance.onTokenRefresh.listen((newToken){
    FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set({"token" : newToken.toString()} ,SetOptions(merge: true));
  });
}

static Future<void> initLocalNotifications() async {
  debugPrint("\n ............................ hello I am under the water please help me ..........................\n");
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  // Create high-priority channel
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // ID
    'High Importance Notifications', // Name
    importance: Importance.max,
  );
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  }
}
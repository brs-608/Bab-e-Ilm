import 'package:bab_e_ilm/Utils/NotificationHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  Future<void> init() async {

    const AndroidInitializationSettings androidInit =
    AndroidInitializationSettings('@drawable/app_logo');

    const InitializationSettings settings = InitializationSettings(
      android: androidInit,
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        NotificationHelper.handleNotificationTap(response);
      },
    );
  }

  Future<void> showBigTextNotification({
    required String title,
    required String body,
    required String notificationType
  }) async {
    BigTextStyleInformation bigTextStyle = BigTextStyleInformation(
      body,
      contentTitle: title,
      htmlFormatContent: true,
    );

    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.high,
      priority: Priority.high,
      color: Colors.blue,
      colorized: true,
      styleInformation: bigTextStyle,
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction('open_app', 'Open App'),
        AndroidNotificationAction('dismiss', 'Dismiss'),
      ],
    );

    NotificationDetails details = NotificationDetails(android: androidDetails);
    int notificationId = DateTime.now().millisecondsSinceEpoch.remainder(100000);
    await flutterLocalNotificationsPlugin.show(
      notificationId,
      title,
      body,
      details,
    );
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String email = auth.currentUser!.email.toString();
    await firestore.collection("notifications").doc("${DateTime.now()}").set({"title" : title.toString(),"body" : body.toString(),"notifiedTo" : email,"dateTime" : DateTime.now(),"notificationType" : notificationType},);

  }
}
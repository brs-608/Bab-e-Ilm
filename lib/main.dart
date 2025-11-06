import 'package:bab_e_ilm/Bloc/Auth/auth_bloc.dart';
import 'package:bab_e_ilm/Bloc/HomePages/user_info_bloc.dart';
import 'package:bab_e_ilm/Bloc/LikeDislike/like_dislike_bloc.dart';
import 'package:bab_e_ilm/Bloc/ProfilePic/getting_pic_bloc.dart';
import 'package:bab_e_ilm/Bloc/SelectedSubject/selected_subject_bloc.dart';
import 'package:bab_e_ilm/Bloc/VideoPlayer/video_player_bloc.dart';
import 'package:bab_e_ilm/Bloc/checking.dart';
import 'package:bab_e_ilm/provider/themeProvider.dart';
import 'package:bab_e_ilm/views/Auth/screens/login_screen.dart';
import 'package:bab_e_ilm/views/Auth/screens/register_screen.dart';
import 'package:bab_e_ilm/views/Auth/screens/splash_screen.dart';
import 'package:bab_e_ilm/views/ClassLecturesNotes/class_room.dart';
import 'package:bab_e_ilm/views/ClassLecturesNotes/class_screen.dart';
import 'package:bab_e_ilm/views/Homepage/screens/classes.dart';
import 'package:bab_e_ilm/views/Homepage/screens/home_page.dart';
import 'package:bab_e_ilm/views/ProfileSetup/name_username.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'Services/NotificationService.dart';
import 'firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bab_e_ilm/Utils/FirebaseMessaging.dart';



@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("\n\n\n\n\n\n\n\n\n\n\n\n\n we're getting something \n\n\n\n\n\n\n\n\n\n\n\n\n");
    if(message.data.isNotEmpty){
      // var authInst = FirebaseAuth.instance;
      // String email = authInst.currentUser!.email!.toString();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform
      );
      debugPrint("69696969");
      // var inst = FirebaseFirestore.instance;
      // await inst.collection("notifications").doc("${DateTime.now()}").set({"title" : message.data["title"].toString(),"body" : message.data["body"].toString(),"notifiedTo" : "burhanshaikh740@gmail.com","dateTime" : DateTime.now()});
      NotificationService().showBigTextNotification(title: message.data["title"].toString(), body: message.data["body"].toString(),notificationType: message.data["notificationType"].toString());
    }
  debugPrint("Handling a background message: ${message.messageId}");
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await NotificationService().init();
  runApp(BabEIlm());

}

class BabEIlm extends StatefulWidget {
  const BabEIlm({super.key});

  @override
  State<BabEIlm> createState() => _BabEIlmState();
}

class _BabEIlmState extends State<BabEIlm> {

  @override
  Widget build(BuildContext context) {
    // SetupNotifications.initLocalNotifications();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ThemeProvider())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => UserInfoBloc()),
          BlocProvider(create: (_) => VideoPlayerBloc()),
          BlocProvider(create: (_) => SelectedSubjectBloc()),
          BlocProvider(create: (_) => AuthBloc()),
          BlocProvider(create: (_) => LikeDislikeBloc()),
          BlocProvider(create: (_) => GettingPicBloc())
        ],
        child: ResponsiveSizer(

          builder: (context,orientation,screenType){
            final themeProvider = Provider.of<ThemeProvider>(context,listen: true);
            return MaterialApp(
              navigatorKey: navigatorKey,
              title: "Bab-e-Ilm",

              theme: ThemeData(
                brightness: themeProvider.brightnessOfApp,
                primaryColor: Colors.white,
              ),
                debugShowCheckedModeBanner: true,
                // home: SplashScreen(),
              home: SplashScreen()
            );
          },
        ),
      ),
    );
  }
}

import 'package:bab_e_ilm/Bloc/Auth/auth_bloc.dart';
import 'package:bab_e_ilm/Bloc/HomePages/user_info_bloc.dart';
import 'package:bab_e_ilm/Bloc/LikeDislike/like_dislike_bloc.dart';
import 'package:bab_e_ilm/Bloc/SelectedSubject/selected_subject_bloc.dart';
import 'package:bab_e_ilm/Bloc/VideoPlayer/video_player_bloc.dart';
import 'package:bab_e_ilm/views/Auth/screens/login_screen.dart';
import 'package:bab_e_ilm/views/Auth/screens/register_screen.dart';
import 'package:bab_e_ilm/views/Auth/screens/splash_screen.dart';
import 'package:bab_e_ilm/views/ClassLecturesNotes/class_room.dart';
import 'package:bab_e_ilm/views/ClassLecturesNotes/class_screen.dart';
import 'package:bab_e_ilm/views/Homepage/screens/classes.dart';
import 'package:bab_e_ilm/views/Homepage/screens/home_page.dart';
import 'package:bab_e_ilm/views/ProfileSetup/name_username.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );

  runApp(BabEIlm());

}

class BabEIlm extends StatelessWidget {
  const BabEIlm({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserInfoBloc()),
        BlocProvider(create: (_) => VideoPlayerBloc()),
        BlocProvider(create: (_) => SelectedSubjectBloc()),
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => LikeDislikeBloc()),
      ],
      child: ResponsiveSizer(
        builder: (context,orientation,screenType){
          return MaterialApp(
            title: "Bab-e-Ilm",
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
          );
        },
      ),
    );
  }
}

import 'package:bab_e_ilm/provider/selectedSubject.dart';
import 'package:bab_e_ilm/provider/videoPlayer.dart';
import 'package:bab_e_ilm/views/Auth/screens/login_screen.dart';
import 'package:bab_e_ilm/views/Auth/screens/register_screen.dart';
import 'package:bab_e_ilm/views/Auth/screens/splash_screen.dart';
import 'package:bab_e_ilm/views/ClassLecturesNotes/class_screen.dart';
import 'package:bab_e_ilm/views/Homepage/screens/classes.dart';
import 'package:bab_e_ilm/views/Homepage/screens/home_page.dart';
import 'package:bab_e_ilm/views/ProfileSetup/name_username.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VideoPlayerState()),
        ChangeNotifierProvider(create: (_) => SelectedSubjectProvider())
      ],
      child: ResponsiveSizer(
        builder: (context,orientation,screenType){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
          );
        },
      ),
    );
  }
}

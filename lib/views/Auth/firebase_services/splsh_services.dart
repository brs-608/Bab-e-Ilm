import 'dart:async';
import 'package:bab_e_ilm/Bloc/HomePages/user_info_bloc.dart';
import 'package:bab_e_ilm/views/Auth/firebase_services/storingName.dart';
import 'package:bab_e_ilm/views/Auth/screens/login_screen.dart';
import 'package:bab_e_ilm/views/Homepage/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SplashServices {
  Future<void> isLogin(BuildContext context) async {
    final auth = FirebaseAuth.instance; // instance of firebase auth class
    final user = auth.currentUser; // fetching the current user (if already logged in and exists)
    final infoProvider = BlocProvider.of<UserInfoBloc>(context); // reference of UserInfoBloc provider
    // this below condition is for checking the user is already logged in otherwise user is not logged in or not exist.
    if (user != null) {
      // adding the timer for smooth fetching.
      Timer(Duration(seconds: 5), () async {
        final userEmail = user.email.toString(); // fetching the email of current user.
        infoProvider.add(StoreInfo(userEmail)); // adding the event to the UserInfoBloc and the event is StoreInfo , it is for fetching user info for the rest of app.
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(email: userEmail,)));
      });
    } // the below else condition is for if the user is not logged in or dose not exists.
    else {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen())); // Navigating to login screen to sign in.
      });
    }
  }
}

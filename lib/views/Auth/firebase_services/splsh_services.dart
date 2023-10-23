import 'dart:async';
import 'package:bab_e_ilm/views/Auth/firebase_services/storingName.dart';
import 'package:bab_e_ilm/views/Auth/screens/login_screen.dart';
import 'package:bab_e_ilm/views/Homepage/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class SplashServices{
  Future<void> isLogin(BuildContext context)async{
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user != null){
      Timer(Duration(seconds: 5),()async{
        final userEmail = user.email.toString();

          GetInfo.info = await UserInfoFireStore().getUserInfo(userEmail);
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomePage()));
      });
    }else{
      Timer(Duration(seconds: 3),(){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
      });
    }

  }
}
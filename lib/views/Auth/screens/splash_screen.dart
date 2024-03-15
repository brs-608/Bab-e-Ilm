import 'package:bab_e_ilm/views/Auth/firebase_services/splsh_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Container(
            height: 130,
              width: 130,
              child: Image.asset("assets/11.png")),
          SizedBox(height: 5,),
          // Container(alignment:Alignment.center,child: CircularProgressIndicator(color: Colors.deepPurple,)),
          Center(child: Text("بابِ علم",style: TextStyle(color: Colors.black,fontFamily: "jameel",fontSize: 32,fontWeight: FontWeight.w900),))
        ]

      ),
    );
  }
}

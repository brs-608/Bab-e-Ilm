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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text("بابِ علم",textAlign:TextAlign.center,style: TextStyle(fontFamily:"jameel",fontWeight: FontWeight.w900,fontSize: 30,),),
          SizedBox(height:20),
          Container(alignment:Alignment.center,child: CircularProgressIndicator(color: Colors.deepPurple,)),
        ]

      ),
    );
  }
}

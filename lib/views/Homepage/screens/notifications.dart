import 'package:bab_e_ilm/views/Homepage/screens/home_page.dart';
import 'package:bab_e_ilm/views/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;
    return Scaffold(
      appBar: PreferredSize(

          preferredSize: Size.fromHeight(70),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(30)),
                gradient: LinearGradient(colors: [
                  Color(0xffa029ff),
                  Color(0xff8304e5),
                  Color(0xff4d008c),
                ])),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Notifications",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 20),
                    )),
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15,),
            Container(padding: EdgeInsets.only(right: 20),alignment:  Alignment.topRight,child: TextButton(onPressed: (){},child: Text("Clear All",style: GoogleFonts.poppins(color:brightness == Brightness.light?Colors.deepPurple:Colors.white.withOpacity(0.8)),),),),
              NotificationWidget(notificationType: "notesNotification",notificationMessage: 'Physics Chapter 1 "Fundamental of Physics" notes has been uploaded.'),
              NotificationWidget(notificationType: "videoCallNotification",notificationMessage: 'Join the live calass of Physics of chapter 1. '),
              NotificationWidget(notificationType: "subscribtionNotification",notificationMessage: 'Your subscibtion will be expire on 14 June 2024, renew it before it get expired to get 10% off.'),
              SizedBox(height: 15,),
        
          ]
        ),
      ),
    );
  }
}

import 'package:bab_e_ilm/views/Homepage/screens/home_page.dart';
import 'package:bab_e_ilm/views/widget/notification_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import '../../../Bloc/HomePages/user_info_bloc.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;
    return BlocBuilder<UserInfoBloc, UserInfoState>(
  builder: (context, state) {
    if(state is UserDataState){
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

        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("notifications").where("notifiedTo",isEqualTo: state.data["email"].toString()).orderBy("dateTime",).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: Text("Waiting......",style: TextStyle(color: Colors.black,fontSize: 24),),);
              }else if (snapshot.hasError){
                return Center(child: Text("Something went wrong!",style: TextStyle(color: Colors.black,fontSize: 24),),);
              }else if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                return Center(child: Text("No Notifications",style: TextStyle(color: Colors.black,fontSize: 24),),);
              }
              final notificationDocs = snapshot.data!.docs;
              final notificationWidget = notificationDocs.map((notification) {
                final data = notification.data() as Map<String,dynamic>;
                print(data);
                return NotificationWidget(notificationType : notification["notificationType"], notificationMessage: notification["body"]);
              }).toList();
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(padding: EdgeInsets.only(right: 20),alignment:  Alignment.topRight,child: TextButton(onPressed: ()async{
                      print("clicked clear all");
                      final querySnapshot = await FirebaseFirestore.instance.collection("notifications").where("notifiedTo", isEqualTo: state.data["email"]).get();
                      for(var doc in querySnapshot.docs){
                        await doc.reference.delete();
                      }
                    },child: Text("Clear All",style: GoogleFonts.poppins(color:brightness == Brightness.light?Colors.deepPurple:Colors.white.withOpacity(0.8)),),),),
                    SizedBox(height: 15,),
                    Column(
                      children: notificationWidget.reversed.toList(),
                    ),
                    SizedBox(height: 15,),
                  ]
                ),
              );
            }
        ),
      );
    }
    return Center(
        child: Text("Something Went Wrong!",style: TextStyle(color: Colors.deepPurple,fontSize: 26),));
  },
);
  }
}

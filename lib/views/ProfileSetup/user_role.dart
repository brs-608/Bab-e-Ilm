import 'package:bab_e_ilm/views/Homepage/screens/home_page.dart';
import 'package:bab_e_ilm/views/ProfileSetup/board_selection.dart';
import 'package:bab_e_ilm/views/ProfileSetup/teacher_code.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Utils/utilites.dart';
import '../Auth/firebase_services/storingName.dart';
import '../Auth/screens/register_screen.dart';

class UserRole extends StatefulWidget {
  const UserRole({super.key});

  @override
  State<UserRole> createState() => _UserRoleState();
}

class _UserRoleState extends State<UserRole> {
  String? role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xffa414ff),
                            Color(0xff7604ef),
                            Color(0xff5001b2),
                          ]
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(child: Text("Role Setup",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w900),)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 100,bottom: 30),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 10
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Text("Select Your Role",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepPurple),),
                        SizedBox(height: 20,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  role = "teacher";
                                });
                              },
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: role == "teacher"?Colors.deepPurple:Colors.black,
                                        width: role == "teacher"? 2:1
                                    )
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    role == "teacher"?Icon(Icons.check_circle,color: Colors.green,):Icon(FontAwesomeIcons.circleXmark,color: Colors.red,),
                                    SizedBox(width: 10,),
                                    Text("I am a Teacher",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
                                  ],
                                ),
                              ),
                            )
                        ),
                        SizedBox(height: 20,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  role = "student";
                                });
                              },
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: role == "student"?Colors.deepPurple:Colors.black,
                                        width: role == "student"? 2:1
                                    )
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    role == "student"?Icon(Icons.check_circle,color: Colors.green,):Icon(FontAwesomeIcons.circleXmark,color: Colors.red,),
                                    SizedBox(width: 10,),
                                    Text("I am a Student",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
                                  ],
                                ),
                              ),
                            )
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.deepPurple
                                )
                            ),
                            onPressed: ()  {
                              if(role == "teacher"){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TeacherCode()));
                              }else if(role == "student"){
                                UserInfoFireStore().storingRole(RegisterEmail.email!, role!);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BoardSetup(email: RegisterEmail.email!,)));
                              }else{
                                Utils().toastMessage("Please select your role");
                              }

                            },
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Next",style: TextStyle(fontSize: 16,color: Colors.white),))
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}

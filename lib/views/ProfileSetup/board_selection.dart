import 'package:bab_e_ilm/views/Auth/firebase_services/storingName.dart';
import 'package:bab_e_ilm/views/Auth/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Utils/utilites.dart';
import '../Auth/screens/login_screen.dart';
import 'class_setup.dart';

class BoardSetup extends StatefulWidget {
  String email;
  BoardSetup({required this.email});

  @override
  State<BoardSetup> createState() => _BoardSetupState();
}

class _BoardSetupState extends State<BoardSetup> {
  String? board;
  storeUserInfo()async{
    GetInfo.info = await UserInfoFireStore().getUserInfo(RegisterEmail.email!);
  }
  @override
  Widget build(BuildContext context) {
    String _email = widget.email;
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
                  child: Center(child: Text("Board Setup",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w900),)),
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
                        Text("Select Your Board",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepPurple),),
                        SizedBox(height: 20,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  board = "O/A Levels";
                                });
                              },
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: board == "O/A Levels"?Colors.deepPurple:Colors.black,
                                        width: board == "O/A Levels"? 2:1
                                    )
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    board == "O/A Levels"?Icon(Icons.check_circle,color: Colors.green,):Icon(FontAwesomeIcons.circleXmark,color: Colors.red,),
                                    SizedBox(width: 10,),
                                    Text("O/A Levels",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
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
                                board = "BSEK/BIEK";
                              });
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: board == "BSEK/BIEK"?Colors.deepPurple:Colors.black,
                                  width: board == "BSEK/BIEK"? 2:1
                                )
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10,),
                                  board == "BSEK/BIEK"?Icon(Icons.check_circle,color: Colors.green,):Icon(FontAwesomeIcons.circleXmark,color: Colors.red,),
                                  SizedBox(width: 10,),
                                  Text("BSEK/BIEK",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
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
                              if(board == "BSEK/BIEK"){
                                UserInfoFireStore().storingBoard(_email, board!);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ClassSetup(email: _email,)));
                              }else if(board == "O/A Levels"){
                                UserInfoFireStore().storingBoard(_email, board!);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OALavels(email: _email,)));
                              }else{
                                Utils().toastMessage("Please select your board");
                              }

                            },
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Next",style: TextStyle(fontSize: 16,color : Colors.white),))
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

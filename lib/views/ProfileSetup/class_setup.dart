import 'package:bab_e_ilm/Utils/utilites.dart';
import 'package:bab_e_ilm/views/Auth/firebase_services/storingName.dart';
import 'package:bab_e_ilm/views/Auth/screens/register_screen.dart';
import 'package:bab_e_ilm/views/Homepage/screens/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Auth/screens/login_screen.dart';

class ClassSetup extends StatefulWidget {
  String email;
  ClassSetup({required this.email});

  @override
  State<ClassSetup> createState() => _ClassSetupState();
}

class _ClassSetupState extends State<ClassSetup> {
  int? grade;
  bool loading = false;
  void storeUserInfo()async{
    GetInfo.info = await UserInfoFireStore().getUserInfo(widget.email);
  }
  burhan(int grade1) async {
    var info1 = GetInfo.info;
    final grade2 = grade1;
    final collectionReference = FirebaseFirestore.instance.collection("groups");
    final user = RegisterEmail.email;
    final subjectIDQuery = await collectionReference
        .where("subjectID")
        .get(); // Retrieve documents that match the query

    try {
      for (QueryDocumentSnapshot doc in subjectIDQuery.docs) {
        String subjectID = doc.get("subjectID");

        if (subjectID.endsWith("9") && grade2 == 9) {
          await collectionReference.doc(doc.id).update({
            "members": FieldValue.arrayUnion([user.toString()])
          });
        } else if (subjectID.endsWith("10") && grade2 == 10) {
          await collectionReference.doc(doc.id).update({
            "members": FieldValue.arrayUnion([user.toString()])
          });
        } else if (subjectID.endsWith("11")&& grade2 == 11) {
          await collectionReference.doc(doc.id).update({
            "members": FieldValue.arrayUnion([user.toString()])
          });
        }
      }
      print("Work done successfully");
    } catch (e) {
      print("Error occurred");
      print(e.toString());
    }
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
                  child: Center(child: Text("Grade Setup",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w900),)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 100,bottom: 30),
                  child: Container(
                    width: double.infinity,
                    height: 500,
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
                        Text("Select Your Grade",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepPurple),),
                        SizedBox(height: 20,),
                        Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          grade = 9;
                                        });
                                      },
                                      child: Container(
                                        height: 60,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: grade == 9?Colors.deepPurple:Colors.black,
                                                width: grade == 9? 2:1
                                            )
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(width: 10,),
                                            grade == 9?Icon(Icons.check_circle,color: Colors.green,):Icon(FontAwesomeIcons.circleXmark,color: Colors.red,),
                                            SizedBox(width: 10,),
                                            Text("Grade 9",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
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
                                          grade = 10;
                                        });
                                      },
                                      child: Container(
                                        height: 60,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: grade == 10?Colors.deepPurple:Colors.black,
                                                width: grade == 10? 2:1
                                            )
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(width: 10,),
                                            grade == 10?Icon(Icons.check_circle,color: Colors.green,):Icon(FontAwesomeIcons.circleXmark,color: Colors.red,),
                                            SizedBox(width: 10,),
                                            Text("Grade 10",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
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
                                          grade = 11;
                                        });
                                      },
                                      child: Container(
                                        height: 60,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: grade == 11?Colors.deepPurple:Colors.black,
                                                width: grade == 11? 2:1
                                            )
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(width: 10,),
                                            grade == 11?Icon(Icons.check_circle,color: Colors.green,):Icon(FontAwesomeIcons.circleXmark,color: Colors.red,),
                                            SizedBox(width: 10,),
                                            Text("Grade XI",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
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
                                          grade = 12;
                                        });
                                      },
                                      child: Container(
                                        height: 60,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: grade == 12?Colors.deepPurple:Colors.black,
                                                width: grade == 12? 2:1
                                            )
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(width: 10,),
                                            grade == 12?Icon(Icons.check_circle,color: Colors.green,):Icon(FontAwesomeIcons.circleXmark,color: Colors.red,),
                                            SizedBox(width: 10,),
                                            Text("Grade XII",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                                SizedBox(height: 20,),
                              ],
                            ),
                            Padding(padding:EdgeInsets.only(top: 100),child: Center(child: loading == true?CircularProgressIndicator(color: Colors.deepPurple,):null)),
                          ],
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.deepPurple
                                )
                            ),
                            onPressed: ()  async{
                              setState(() {
                                loading = true;
                              });
                              if(grade == null){
                                setState(() {
                                  loading = false;
                                });
                                Utils().toastMessage("Please select your grade");
                              }else{
                                await UserInfoFireStore().storingGrade(_email, grade!);
                                await burhan(grade!);
                                storeUserInfo();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage(email: RegisterEmail.email!,)));
                              }
                            },
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Create Account",style: TextStyle(fontSize: 16),))
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

class OALavels extends StatefulWidget {
  String email;
  OALavels({required this.email});

  @override
  State<OALavels> createState() => _OALavelsState();
}

class _OALavelsState extends State<OALavels> {
  int? grade;
  bool loading = false;
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
                  child: Center(child: Text("Grade Setup",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w900),)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 100,bottom: 30),
                  child: Container(
                    width: double.infinity,
                    height: 500,
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
                        Text("Select Your Grade",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepPurple),),
                        Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 20,),
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          grade = 9;
                                        });
                                      },
                                      child: Container(
                                        height: 60,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: grade == 9?Colors.deepPurple:Colors.black,
                                                width: grade == 9? 2:1
                                            )
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(width: 10,),
                                            grade == 9?Icon(Icons.check_circle,color: Colors.green,):Icon(FontAwesomeIcons.circleXmark,color: Colors.red,),
                                            SizedBox(width: 10,),
                                            Text("O Levels",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
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
                                          grade = 10;
                                        });
                                      },
                                      child: Container(
                                        height: 60,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: grade == 10?Colors.deepPurple:Colors.black,
                                                width: grade == 10? 2:1
                                            )
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(width: 10,),
                                            grade == 10?Icon(Icons.check_circle,color: Colors.green,):Icon(FontAwesomeIcons.circleXmark,color: Colors.red,),
                                            SizedBox(width: 10,),
                                            Text("A Levels",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                                SizedBox(height: 20,),
                              ],
                            ),
                            Padding(padding:EdgeInsets.only(top: 70),child: Center(child: loading == true?CircularProgressIndicator(color: Colors.deepPurple,):null)),
                          ],
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.deepPurple
                                )
                            ),
                            onPressed: ()async{
                              setState(() {
                                loading = true;
                              });
                              if(grade == null){
                                setState(() {
                                  loading = false;
                                });
                                Utils().toastMessage("Please select your grade");
                              }else{
                                await UserInfoFireStore().storingGrade(_email, grade!);
                                storeUserInfo();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage(email: RegisterEmail.email!,)));
                              }
                            },
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Create Account",style: TextStyle(fontSize: 16),))
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

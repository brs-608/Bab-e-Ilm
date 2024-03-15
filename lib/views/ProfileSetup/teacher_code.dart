import 'package:bab_e_ilm/Utils/utilites.dart';
import 'package:bab_e_ilm/views/Homepage/screens/home_page.dart';
import 'package:bab_e_ilm/views/ProfileSetup/board_selection.dart';
import 'package:bab_e_ilm/views/ProfileSetup/user_role.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Auth/firebase_services/storingName.dart';
import '../Auth/screens/login_screen.dart';
import '../Auth/screens/register_screen.dart';

class TeacherCode extends StatefulWidget {
  const TeacherCode({super.key});

  @override
  State<TeacherCode> createState() => _TeacherCodeState();
}

class _TeacherCodeState extends State<TeacherCode> {
  TextEditingController codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool obscure = true;
  void storeUserInfo()async{
    GetInfo.info = await UserInfoFireStore().getUserInfo(RegisterEmail.email!);
  }
  addUserToGroup() async {
    var info1 = GetInfo.info;
    final collectionReference = FirebaseFirestore.instance.collection("groups");
    final user = RegisterEmail.email;
    final subjectIDQuery = await collectionReference
        .where("subjectID")
        .get(); // Retrieve documents that match the query

    try {
      for (QueryDocumentSnapshot doc in subjectIDQuery.docs) {
        String subjectID = doc.get("subjectID");

        if (subjectID.endsWith("9")) {
          await collectionReference.doc(doc.id).update({
            "members": FieldValue.arrayUnion([user.toString()])
          });
        } else if (subjectID.endsWith("10")) {
          await collectionReference.doc(doc.id).update({
            "members": FieldValue.arrayUnion([user.toString()])
          });
        } else if (subjectID.endsWith("11")) {
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    codeController.dispose();
  }
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
                child: Center(child: Text("Teacher Code",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w900),)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 100,bottom: 30),
                child: Container(
                  width: double.infinity,
                  height: 450,
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
                      Text("Verify that you are teacher",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepPurple),),
                      SizedBox(height: 30,),
                      Stack(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextFormField(
                                    controller: codeController,
                                    obscureText: obscure,
                                    style: TextStyle(color: Colors.deepPurple),
                                    decoration: InputDecoration(
                                      suffixIcon: InkWell(onTap:(){
                                        setState(() {
                                          obscure = !obscure;
                                        });
                                      },child: obscure?Icon(Icons.visibility_off,color: Colors.deepPurple,):Icon(Icons.visibility,color: Colors.deepPurple,)),
                                      hintText: "Enter the teacher code",
                                      label: Text("Teacher Code",style: TextStyle(color: Colors.deepPurple),),
                                      prefixIcon: Icon(Icons.key,color: Colors.deepPurple,),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.deepPurple
                                          )
                                      ),
                                      border:  OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black
                                          )
                                      ),
                                      fillColor: Colors.grey.withOpacity(0.1),
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return "Enter the Teacher code";
                                      }else{
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(padding:EdgeInsets.only(top: 60),child: Center(child: loading == true?CircularProgressIndicator(color: Colors.deepPurple,):null)),
                        ],
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
                          onPressed: ()async{
                            if(_formKey.currentState!.validate()){
                              bool isTeacherCodeCorrect = await UserInfoFireStore().checkTeacherCode(codeController.text.toString());
                              setState(() {
                                loading = true;
                              });
                              if(isTeacherCodeCorrect){
                                await UserInfoFireStore().storingRole(RegisterEmail.email!, "teacher");
                                await addUserToGroup();
                                storeUserInfo();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage(email: RegisterEmail.email!,)));
                              }else{
                                setState(() {
                                  loading = false;
                                });
                                Utils().toastMessage("Invalid teacher code");
                              }
                            }
                          }, child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Create Account",style: TextStyle(fontSize: 16,color: Colors.white),))
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("I am a student ."),
                          SizedBox(width: 5,),
                          TextButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserRole()));},child: Text("Create Student Account",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 16)),)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

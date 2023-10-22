import 'package:bab_e_ilm/views/Auth/firebase_services/storingName.dart';
import 'package:bab_e_ilm/views/Auth/screens/register_screen.dart';
import 'package:bab_e_ilm/views/Homepage/screens/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Utils/utilites.dart';

class StoredEmail{
  static String? email;
}
class GetInfo{
  static Map<String,dynamic>? info;
}
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore inst = FirebaseFirestore.instance;
  bool obscure = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void storeEmail(){
    StoredEmail.email = emailController.text.toString();
  }
  void storeUserInfo()async{
    GetInfo.info = await UserInfoFireStore().getUserInfo(emailController.text.toString());
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
                child: Center(child: Text("Welcome",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w900),)),
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
                      Text("Login",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepPurple),),
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
                                    controller: emailController,
                                      style: TextStyle(color: Colors.deepPurple),
                                      decoration: InputDecoration(
                                        hintText: "Enter your email",
                                        label: Text("Email",style: TextStyle(color: Colors.deepPurple),),
                                        prefixIcon: Icon(Icons.email_rounded,color: Colors.deepPurple,),
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
                                        return "Enter your email";
                                      }else{
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextFormField(
                                    controller: passwordController,
                                      obscureText: obscure,
                                      style: TextStyle(color: Colors.deepPurple),
                                      decoration: InputDecoration(
                                        suffixIcon: InkWell(onTap:(){
                                          setState(() {
                                            obscure = !obscure;
                                          });
                                        },child: obscure?Icon(Icons.visibility_off,color: Colors.deepPurple,):Icon(Icons.visibility,color: Colors.deepPurple,)),
                                        hintText: "Enter your password",
                                        label: Text("Password",style: TextStyle(color: Colors.deepPurple),),
                                        prefixIcon: Icon(Icons.lock,color: Colors.deepPurple,),
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
                                        return "Enter your password";
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
                              setState(() {
                                loading = true;
                              });
                              storeEmail();
                              storeUserInfo();
                              await _auth.signInWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString()).then((value) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage(email: emailController.text.toString(),)));
                              }).onError((error, stackTrace) {
                                setState(() {
                                  loading = false;
                                });
                                if(error.toString().contains("no user record")){
                                  Utils().toastMessage("No user found ");
                                }else{
                                  Utils().toastMessage("Wrong Password!");
                                }

                              });
                            }
                          }, child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Login",style: TextStyle(fontSize: 16),))
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          SizedBox(width: 5,),
                          TextButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen()));},child: Text("Create Account",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 16)),)
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


import 'package:bab_e_ilm/Utils/utilites.dart';
import 'package:bab_e_ilm/firebase_options.dart';
import 'package:bab_e_ilm/views/Auth/screens/login_screen.dart';
import 'package:bab_e_ilm/views/ProfileSetup/name_username.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bab_e_ilm/views/Auth/firebase_services/storingName.dart';

class RegisterEmail{
  static String? email;
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscure = true;
  final _name = TextEditingController();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool shouldGo = false;
  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserInfoFireStore userInfo = UserInfoFireStore();
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _password.dispose();
    _name.dispose();
    _username.dispose();
  }
  void storeUserInfo()async{
    GetInfo.info = await UserInfoFireStore().getUserInfo(_email.text.toString());
  }
  void storeEmail(){
    RegisterEmail.email = _email.text.toString();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                  gradient: LinearGradient(colors: [
                Color(0xffa414ff),
                Color(0xff7604ef),
                Color(0xff5001b2),
              ])),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                  child: Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900),
              )),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 100, bottom: 30),
              child: Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 10)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Register Your Account",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.deepPurple),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    controller: _name,
                                    style: TextStyle(color: Colors.deepPurple),
                                    decoration: InputDecoration(
                                      hintText: "Enter your full name",
                                      label: Text(
                                        "Name",
                                        style: TextStyle(color: Colors.deepPurple),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.deepPurple,
                                      ),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.deepPurple)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      fillColor: Colors.grey.withOpacity(0.1),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter your name";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _username,
                                    style: TextStyle(color: Colors.deepPurple),
                                    decoration: InputDecoration(
                                      hintText: "Create your username",
                                      label: Text(
                                        "Username",
                                        style: TextStyle(color: Colors.deepPurple),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.alternate_email,
                                        color: Colors.deepPurple,
                                      ),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.deepPurple)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      fillColor: Colors.grey.withOpacity(0.1),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "create your user name";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _email,
                                    style: TextStyle(color: Colors.deepPurple),
                                    decoration: InputDecoration(
                                      hintText: "Enter your email",
                                      label: Text(
                                        "Email",
                                        style: TextStyle(color: Colors.deepPurple),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.email_rounded,
                                        color: Colors.deepPurple,
                                      ),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.deepPurple)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      fillColor: Colors.grey.withOpacity(0.1),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter your email";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: _password,
                                    obscureText: obscure,
                                    style: TextStyle(color: Colors.deepPurple),
                                    decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              obscure = !obscure;
                                            });
                                          },
                                          child: obscure
                                              ? Icon(
                                                  Icons.visibility_off,
                                                  color: Colors.deepPurple,
                                                )
                                              : Icon(
                                                  Icons.visibility,
                                                  color: Colors.deepPurple,
                                                )),
                                      hintText: "Create your password",
                                      label: Text(
                                        "Password",
                                        style: TextStyle(color: Colors.deepPurple),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.deepPurple,
                                      ),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.deepPurple)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      fillColor: Colors.grey.withOpacity(0.1),
                                    ),
                                    validator: (value) {
                                      bool hasEnoughCharacters = value!.length >= 8;
                                      bool containsSymbols = RegExp(r'[!@#\$%^&*()_+{}\[\]:;<>,.?~\\-]').hasMatch(value!);
                                      bool containsNumbers = RegExp(r'\d').hasMatch(value!);
                                      bool containsCapitalLetter = value!.contains(RegExp(r'[A-Z]'));
                                      bool containsSmallLetter = value!.contains(RegExp(r'[a-z]'));
                                      if (value!.isEmpty) {
                                        return "Enter your password";
                                      } else if(hasEnoughCharacters == false || containsSymbols == false  || containsNumbers == false || containsCapitalLetter ==  false || containsSmallLetter == false){
                                        return "Your password should be:\n --> Contain at least 8 characters\n --> Contain at least one capital latter\n --> Contain at least one capital latter\n --> Contain at least one symbol\n --> Contain at least 1 number";
                                      }else{
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(padding:EdgeInsets.only(top: 110),child: Center(child: loading == true?CircularProgressIndicator(color: Colors.deepPurple,):null)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.deepPurple)),
                          onPressed: () async{


                            if (_formKey.currentState!.validate()) {
                              bool isEmailIsFree = await userInfo.isEmailAvailable(_email.text.toString());
                              bool isUserNameAvailable = await userInfo.isUsernameAvailable(_username.text.toString());
                              setState(() {
                                loading = true;
                              });
                              if(isEmailIsFree && isUserNameAvailable){
                                userInfo.storingUserInfo(_name.text.toString(),_username.text.toString(),_email.text.toString(),_password.text.toString());
                                storeUserInfo();
                                storeEmail();
                                await _auth.createUserWithEmailAndPassword(email: _email.text.toString(), password: _password.text.toString()).then((value){
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AccountSetup(email: _email.text.toString(),)));
                                }).onError((error, stackTrace) {
                                  setState(() {
                                    loading = false;
                                    Utils().toastMessage(error.toString());
                                  });

                                });
                              }else if(isUserNameAvailable == false){
                                setState(() {
                                  loading = false;
                                });
                                Utils().toastMessage("username is already taken");
                              }else if(isEmailIsFree == false){
                                loading = false;
                                Utils().toastMessage("This email address is already registered in an another account");
                              }
                            }
                          },
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Next",
                                style: TextStyle(fontSize: 16),
                              ))),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          SizedBox(
                            width: 0,
                          ),
                          TextButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));},child: Text("Login",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 16)),)
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
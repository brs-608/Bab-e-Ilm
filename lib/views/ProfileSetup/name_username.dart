import 'dart:io';
import 'package:bab_e_ilm/views/ProfileSetup/user_role.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:bab_e_ilm/views/Auth/screens/register_screen.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/utilites.dart';
import '../Auth/firebase_services/storingName.dart';
import '../Auth/screens/login_screen.dart';
import 'board_selection.dart';
import 'package:image/image.dart'as im;
import 'package:uuid/uuid.dart';


class AccountSetup extends StatefulWidget {
  String email;
  AccountSetup({required this.email});

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
   String? gender;
   final _formKey = GlobalKey<FormState>();
   final firestoreInst = FirebaseFirestore.instance;
   TextEditingController dateOfBirthController = TextEditingController();
   String? profilePicUrl;
   Future<void> uploadToStorage(File imgFile) async {
     if (imgFile == null) {
       print('Image file is null');
       return;
     }

     try {
       Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now()}.jpg');
       UploadTask uploadTask = storageReference.putFile(imgFile);

       // Wait for the upload to complete.
       await uploadTask;

       if (uploadTask.snapshot.state == TaskState.success) {
         final downloadUrl = await storageReference.getDownloadURL();

         // Update Firestore document with the download URL.
         final userDocRef = firestoreInst.collection('users').doc(widget.email);
         final userDoc = await userDocRef.get();

         if (userDoc.exists) {
           await userDocRef.update({
             'profilePic': downloadUrl,
           });

           print('User profilePic updated successfully');
         } else {
           print('User document not found for email: ${widget.email}');
         }
       } else {
         print('Image upload failed');
       }
     } catch (error) {
       print('Error uploading image and updating Firestore: $error');
     }
   }
   var info = GetInfo.info;
   void retrieveProfilePicUrl() async {
     final userDocRef = firestoreInst.collection('users').doc(widget.email);
     final userDoc = await userDocRef.get();
     if (userDoc.exists) {
       setState(() {
         profilePicUrl = userDoc['profilePic'];
         loading = false;
       });
     }
   }
    bool loading = false;
   @override
  void initState(){
    // TODO: implement initState
    super.initState();
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
                  child: Center(child: Text("Profile Setup",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w900),)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 100,bottom: 30),
                  child: Container(
                    width: double.infinity,
                    height: 560,
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
                        Text("Setup Your Profile",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepPurple),),
                        SizedBox(height: 20,),
                        Container(
                          padding: Device.orientation == Orientation.portrait?EdgeInsets.symmetric(horizontal: 120):EdgeInsets.symmetric(horizontal: 260),
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              CircularProfileAvatar(
                                 profilePicUrl == null? "":profilePicUrl!,
                                onTap: ()async{
                                   setState(() {
                                     loading = true;
                                   });
                                  File? img = await UserInfoFireStore().pickImg();
                                  await uploadToStorage(img!);
                                  retrieveProfilePicUrl();
                                  },
                                backgroundColor: Colors.deepPurple,
                                radius: 50,
                                initialsText: Text("+",style: TextStyle(fontSize: 28,color: Colors.white),),
                              ),
                              Container(alignment:Alignment.center,padding:EdgeInsets.symmetric(vertical: 30),child: loading == true?CircularProgressIndicator(color: Colors.white,):null),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: dateOfBirthController,
                                keyboardType: TextInputType.datetime,
                                style: TextStyle(color: Colors.deepPurple),
                                decoration: InputDecoration(
                                  hintText: "example: 12/05/2006",
                                  label: Text("Date Of Birth",style: TextStyle(color: Colors.deepPurple),),
                                  prefixIcon: Icon(Icons.calendar_month_outlined,color: Colors.deepPurple,),
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
                                    return "Enter your date of birth";
                                  }else{
                                    return null;
                                  }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("What's Your Gender",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepPurple),),
                        SizedBox(height : 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: gender == "male"?GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      gender = "male";
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.male,color: Colors.white,),
                                        SizedBox(width: 10,),
                                        Text("Male",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                                      ],
                                    ),
                                  ),
                                ):GestureDetector(
                                  onTap:(){
                                    setState(() {
                                      gender = "male";
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.male,color: Colors.white,),
                                        SizedBox(width: 10,),
                                        Text("Male",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                                      ],
                                    ),
                                  ),
                                )
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: gender == "female"?GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      gender = "female";
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple,
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.female,color: Colors.white,),
                                        SizedBox(width: 10,),
                                        Text("Female",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                                      ],
                                    ),
                                  ),
                                ):GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      gender = "female";
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.female,color: Colors.white,),
                                        SizedBox(width: 10,),
                                        Text("Female",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                                      ],
                                    ),
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
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
                              if(_formKey.currentState!.validate()){

                                if(gender == null){
                                  Utils().toastMessage("Please select your gender");
                                }else{
                                  UserInfoFireStore().storingDOBAndGender(_email, dateOfBirthController.text.toString(), gender!);
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserRole()));
                                }
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

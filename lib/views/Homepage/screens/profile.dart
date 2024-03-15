import 'package:bab_e_ilm/Bloc/HomePages/user_info_bloc.dart';
import 'package:bab_e_ilm/views/Auth/screens/register_screen.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../Auth/firebase_services/storingName.dart';
import '../../Auth/screens/login_screen.dart';
import 'edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  bool more = false;
  // final firestoreInst = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    DateTime creationDate = user!.metadata.creationTime!;
    String formattedDate = DateFormat('d MMMM y').format(creationDate);
    // var info = GetInfo.info;
    // String role = info!['UserRole'];
    
    return BlocBuilder<UserInfoBloc, UserInfoState>(
  builder: (context, state) {
    if(state is UserDataState){
      var info = state.data;
      String role = info["UserRole"];
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text("My Profile",style: GoogleFonts.poppins(fontWeight: FontWeight.w900,fontSize: 22),),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10,left: 10),
                child: CircularProfileAvatar (
                  info?['profilePic'] == null? "":info!['profilePic'],
                  radius: 70,
                  elevation: 11,
                  backgroundColor: Colors.blue,
                  borderColor: Colors.deepPurple,
                  borderWidth: 3,
                  cacheImage: true,
                  errorWidget: (context,url,error){
                    return Icon(Icons.person);
                  },
                  onTap: (){},
                  animateFromOldImageOnUrlChange: true,
                  placeHolder: (context,url){
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),
              Text("${info!["fullName"]}",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 2),),
              SizedBox(height: 3,),
              Text("${info["userName"]}",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.bold,letterSpacing: 1),),
              SizedBox(height: 10,),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.deepPurple
                          ),
                          borderRadius: BorderRadius.circular(30),
                        )
                    ),

                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                  }
                  , child: Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),child: Text("Edit Profile Details",style: TextStyle(color: Colors.deepPurple),))),
              SizedBox(height: 25,),
              CardDetailRow(clr: Colors.grey.withOpacity(0.2), icon: Icons.email, type: 'Email', val: '${info['email']}',),
              SizedBox(height: 15,),
              role == "student"?CardDetailRow(clr: Colors.transparent, icon: Icons.school, type: 'Grade', val: '${info['grade']}',):Container(),
              role == "student"?SizedBox(height: 15,):Container(),
              CardDetailRow(clr: role == "student"?Colors.grey.withOpacity(0.2):Colors.transparent, icon: Icons.phone, type: 'Phone', val: info["phone"] == null ?'Not Currently Set':info["phone"],typeColor: Colors.red,),
              more&& role == "student"?SizedBox(height: 15,) :more?SizedBox(height: 15,):Container(),
              more?CardDetailRow(clr: role == "student"?Colors.transparent:Colors.grey.withOpacity(0.2), icon: FontAwesomeIcons.venusMars, type: 'Gender', val: '${info['gender']}',):Container(),
              more&& role == "student"?SizedBox(height: 15,):more&& role == "teacher"||role == "admin"?SizedBox(height: 15,):Container(),
              more?CardDetailRow(clr: role == "student"?Colors.grey.withOpacity(0.2):Colors.transparent, icon: Icons.access_time_rounded, type: 'Account Created', val: formattedDate,):Container(),
              more&& role == "student"?SizedBox(height: 15,):Container(),
              more && role == "student"?CardDetailRow(clr: Colors.transparent, icon: FontAwesomeIcons.school, type: 'Board', val: info["board"],):Container(),
              SizedBox(height: 20,),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.black
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      )
                  ),
                  onPressed: (){
                    setState(() {
                      more = !more;
                    });
                  }, child: Text(more?"Show Less -":"Show More +",style: TextStyle(color: Colors.white),)
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                            colors:[
                              Color(0xffff9955),
                              Color(0xffef782c),

                            ]
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Subscribe to ",style: TextStyle(color: Colors.white),),
                        Text("Premium",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),)
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                            colors:[
                              Color(0xff084ee0),
                              Color(0xff0679da),

                            ]
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Subscribed on ",style: TextStyle(color: Colors.white),),
                        Text("N/A",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      );
    }else{
      return Container();
    }

  },
);
  }
}
class CardDetailRow extends StatelessWidget {

  CardDetailRow(
      {
        required this.clr,
        required this.icon,
        required this.type,
        required this.val,
        this.typeColor,
        this.typeSize
      }
      );
  final IconData icon;
  final String type;
  final String val;
  final Color clr;
  final double? typeSize;
  final Color? typeColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: clr
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(icon),
                  SizedBox(width: 10,),
                  Text(type)
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 15),child: Text(val,style: TextStyle(color: typeColor,fontSize: typeSize),))
          ],
        ),
      ),
    );
  }
}
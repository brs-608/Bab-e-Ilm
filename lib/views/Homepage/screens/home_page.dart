import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bab_e_ilm/Utils/utilites.dart';
import 'package:bab_e_ilm/provider/emailProvider.dart';
import 'package:bab_e_ilm/views/Auth/firebase_services/storingName.dart';
import 'package:bab_e_ilm/views/Homepage/screens/profile.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Auth/screens/login_screen.dart';
import '../../ClassLecturesNotes/creatingGroup.dart';
import '../email_access.dart';
import 'classes.dart';
import 'dashboard.dart';
import 'lectures.dart';



class HomePage extends StatefulWidget {
  String email;
  HomePage({required this.email});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<ScaffoldState> _homePage = GlobalKey();
  int curIndex = 0;




  PageController pageController = PageController(initialPage: 0,);
  final auth = FirebaseAuth.instance;

  final firestoreInst = FirebaseFirestore.instance;
  var info = GetInfo.info;
  String? profilePicUrl;

  void retrieveProfilePicUrl() async {
    final userDocRef = firestoreInst.collection('users').doc(widget.email);
    final userDoc = await userDocRef.get();
    if (userDoc.exists) {
      setState(() {
        profilePicUrl = userDoc['profilePic'];
      });
    }else{
      setState(() {
        profilePicUrl = "";
      });

    }
  }
  Widget pageView() {
      return PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            curIndex = index;
          });
        },
        children: [
          Dashboard(email: widget.email,), // here I want email
          Classes(),
          Lectures(),
          Profile()
        ],
      );
  }


  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    // retrieveProfilePicUrl();

  }
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<EmailProvider>(context);
    return Scaffold(
      key: _homePage,
      appBar: AppBar(
        leading: IconButton(onPressed:(){_homePage.currentState?.openDrawer();},icon:Icon(Icons.menu),color: Colors.deepPurple,),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Bab-e-Ilm",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w900),),
        actions: [
          Padding(padding: EdgeInsets.only(right: 10),child: IconButton(onPressed:(){},icon:Icon(Icons.notifications_active,color: Colors.deepPurple,)))
        ],
      ),
      floatingActionButton: info?["UserRole"] == "admin" && curIndex == 1?FloatingActionButton(
        backgroundColor: Colors.deepPurple,
          onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateGroup()));
            },
          child:Icon(Icons.add,color:Colors.white),tooltip:"Create Class"):null,
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 20,right: 20,top: 50),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircularProfileAvatar(
                          "",
                          radius: 45,
                          elevation: 11,
                          backgroundColor: Colors.blue,
                          borderColor: Colors.deepPurple,
                          borderWidth: 3,
                          cacheImage: true,
                          animateFromOldImageOnUrlChange: true,
                          placeHolder: (context, url) => Container(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context,url,error){
                            return Icon(Icons.person);
                          },
                          onTap: (){
                            setState(() {
                              curIndex = 3;
                            });
                            Navigator.pop(context);
                            pageController.animateToPage(3, duration: Duration(milliseconds: 30), curve: Curves.linear);
                          },
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${info?["fullName"]}",style: GoogleFonts.nunito(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w900),),
                            Text("${info?["email"]}",style: TextStyle(color: Colors.blue,fontSize: 10),)
                          ],
                        )
                      ],
                    ),
              Container(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                    ),
                     backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.deepPurple
                    )
               ),
                    onPressed: (){}, child: Text("  Premium  ",style: TextStyle(color: Colors.white),)),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            Divider(),
            Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: (){Navigator.pop(context);},
                      leading: Icon(Icons.credit_card,color: Colors.blue,size: 30,),
                      title: Text("Subscription",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                    ),
                    ListTile(
                      onTap: (){Navigator.pop(context);},
                      leading: Icon(Icons.settings,color: Colors.blue,size: 30,),
                      title: Text("Settings",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                    ),
                    ListTile(
                      onTap: (){Navigator.pop(context);},
                      leading: Icon(Icons.help,color: Colors.blue,size: 30,),
                      title: Text("Help",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                    ),
                    ListTile(
                      onTap: (){Navigator.pop(context);},
                      leading: Icon(Icons.chat_bubble_outline,color: Colors.blue,size: 30,),
                      title: Text("Feedback",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                    ),
                    ListTile(
                      onTap: (){Navigator.pop(context);},
                      leading: Icon(Icons.share,color: Colors.blue,size: 30,),
                      title: Text("Tell Others",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                    ),
                    ListTile(
                      onTap: (){Navigator.pop(context);},
                      leading: Icon(Icons.star_half_sharp,color: Colors.blue,size: 30,),
                      title: Text("Rate The App",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                    ),
                  ],

                )),
            Expanded(
                flex: 0,
                child: Column(children: [
                  ListTile(
                    onTap: ()async{
                      await auth.signOut().then((value) {
                         Navigator.pushReplacement (context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      }).onError((error, stackTrace) {
                        Utils().toastMessage(error.toString());
                      });
                      },
                    leading: Icon(Icons.logout,size: 24,color: Colors.deepPurple,),
                    title: Text("Sign Out",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold
                    ),),
                  )
                ],))
          ],
        ),
      ),
      bottomNavigationBar:  AnimatedBottomNavigationBar(

        backgroundColor: Colors.white,
          icons: [
            Icons.home,
            Icons.school,
            Icons.video_camera_back_sharp,
            Icons.person,
          ],
        inactiveColor: Color(0xFFB2AFAF),
        activeIndex: curIndex,
        activeColor: Colors.deepPurple,
        iconSize: 28,
        gapWidth: 1,
        onTap: (p0 ) {
            setState(() {
              curIndex = p0;
              pageController.animateToPage(p0, duration: Duration(microseconds: 100), curve: Curves.linear);
            });
      },
      ),
      body: pageView(),
    );
  }
}

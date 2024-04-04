import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bab_e_ilm/Bloc/HomePages/user_info_bloc.dart';
import 'package:bab_e_ilm/Utils/utilites.dart';
import 'package:bab_e_ilm/views/Auth/firebase_services/storingName.dart';
import 'package:bab_e_ilm/views/Homepage/screens/profile.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Auth/screens/login_screen.dart';
import '../../ClassLecturesNotes/creatingGroup.dart';
import '../../DrawerScreens/Customer Support/help.dart';
import '../../DrawerScreens/subscription.dart';
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
  PageController pageController = PageController(
    initialPage: 0,
  );
  final auth = FirebaseAuth.instance;
  // final firestoreInst = FirebaseFirestore.instance;
  // var info = GetInfo.info;
  Widget pageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        setState(() {
          curIndex = index;
        });
      },
      children: [
        Dashboard(
          email: widget.email,
        ),
        Classes(),
        Lectures(),
        Profile()
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // retrieveProfilePicUrl();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<EmailProvider>(context);
    return Scaffold(
      key: _homePage,
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
                      _homePage.currentState?.openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
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
                      "Bab-e-Ilm",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 20),
                    )),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(top: 25, right: 20),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )),
      floatingActionButton: BlocBuilder<UserInfoBloc, UserInfoState>(
        builder: (context, state) {
          if (state is UserDataState) {
            if (state.data["UserRole"] == "admin" && curIndex == 1) {
              return FloatingActionButton(
                  backgroundColor: Colors.deepPurple,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateGroup()));
                  },
                  child: Icon(Icons.add, color: Colors.white),
                  tooltip: "Create Class");
            } else {}
          }
          return Container();
        },
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Column(
                  children: [
                    Row(
                      children: [
                        BlocBuilder<UserInfoBloc, UserInfoState>(
                          builder: (context, state) {
                            if (state is UserDataState) {
                              return CircularProfileAvatar(
                                state.data["profilePic"] ?? "",
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
                                errorWidget: (context, url, error) {
                                  return Icon(Icons.person);
                                },
                                onTap: () {
                                  setState(() {
                                    curIndex = 3;
                                  });
                                  Navigator.pop(context);
                                  pageController.animateToPage(3,
                                      duration: Duration(milliseconds: 30),
                                      curve: Curves.linear);
                                },
                              );
                            }
                            else{
                              return CircularProfileAvatar(
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
                                errorWidget: (context, url, error) {
                                  return Icon(Icons.person);
                                },
                                onTap: () {
                                  setState(() {
                                    curIndex = 3;
                                  });
                                  Navigator.pop(context);
                                  pageController.animateToPage(3,
                                      duration: Duration(milliseconds: 30),
                                      curve: Curves.linear);
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<UserInfoBloc, UserInfoState>(
                                builder: (context, state) {
                                  if (state is UserDataState) {
                                    return Text(
                                      "${state.data["fullName"]}",
                                      style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900),
                                    );
                                  }
                                  return Text("data");
                                },
                              ),
                              BlocBuilder<UserInfoBloc, UserInfoState>(
                                builder: (context, state) {
                                  if (state is UserDataState) {
                                    return Text(
                                      "${state.data["email"]}",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 10),
                                      maxLines: 2,
                                    );
                                  }
                                  return Text("data");
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.deepPurple)),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Subscription()));
                          },
                          child: Text(
                            "  Subscribe  ",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(),
            Expanded(
                child: ListView(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Subscription()));

                  },
                  leading: Icon(
                    Icons.credit_card,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text(
                    "Subscription",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.settings,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Help()));
                  },
                  leading: const Icon(
                    Icons.help,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: const Text(
                    "Help",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: const Text(
                    "Feedback",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.share,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: const Text(
                    "Tell Others",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.star_half_sharp,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: const Text(
                    "Rate The App",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
            Expanded(
                flex: 0,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () async {
                        await auth.signOut().then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        }).onError((error, stackTrace) {
                          Utils().toastMessage(error.toString());
                        });
                      },
                      leading: const Icon(
                        Icons.logout,
                        size: 24,
                        color: Colors.deepPurple,
                      ),
                      title: const Text(
                        "Sign Out",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundGradient: const LinearGradient(colors: [
          Color(0xff4d008c),
          Color(0xff9e0fec),
          Color(0xffb44eea),
        ]),
        leftCornerRadius: 30,
        rightCornerRadius: 0,
        icons: const [
          Icons.home,
          Icons.school,
          Icons.video_camera_back_sharp,
          Icons.person,
        ],
        inactiveColor: Color(0xFFFFFFFF),
        activeIndex: curIndex,
        activeColor: Color(0xffcececb),
        iconSize: 28,
        gapWidth: 1,
        onTap: (p0) {
          setState(() {
            curIndex = p0;
            pageController.animateToPage(p0,
                duration: Duration(microseconds: 100), curve: Curves.linear);
          });
        },
      ),
      body: pageView(),
    );
  }
}

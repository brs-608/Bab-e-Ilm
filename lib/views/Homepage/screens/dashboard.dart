import 'package:bab_e_ilm/Bloc/HomePages/user_info_bloc.dart';
import 'package:bab_e_ilm/views/Auth/screens/login_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Auth/firebase_services/storingName.dart';
class Dashboard extends StatefulWidget {
  String email;
  Dashboard({required this.email});

  @override
  State<Dashboard> createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  UserInfoFireStore userInfo = UserInfoFireStore();

  @override
  Widget build(BuildContext context) {
    // String _email = widget.email;
    Map<String,dynamic>? infoUser;
    final info = BlocProvider.of<UserInfoBloc>(context);
    return BlocListener<UserInfoBloc, UserInfoState>(
        listener: (context, state) {
          if(state is UserDataState){
            infoUser = state.data;
          }
       },
          child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 20,),
              BlocBuilder<UserInfoBloc, UserInfoState>(
               builder: (context, state) {
                  if(state is UserDataState){
                    return Text("Hi,${state.data["fullName"]}",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22,color: Colors.deepPurple),);
                  }
                  return Text("Hi");
              },
          )
            ],
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.1),
              border: Border.all(
                color: Colors.deepPurple,
                width: 2
              )
            ),
            child: TextField(
              cursorColor: Colors.deepPurple,
              textAlign: TextAlign.left,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                  hintText: "search",
                  suffixIcon: Icon(Icons.search,color: Colors.deepPurple,),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)), // Rounded corners for images
                    child: CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        enableInfiniteScroll: true,
                        initialPage: 0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        viewportFraction: 1.8,
                      ),
                      items: [
                        Image.asset(
                          'assets/9.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/10.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/5.jpg',
                          fit: BoxFit.cover,
                        ),
                        // ... Add more images or widgets
                      ],
                    ),
                  ),
                  Padding(
                    padding: Device.orientation == Orientation.portrait?EdgeInsets.only(top: 150):Device.deviceType == DeviceType.web?EdgeInsets.only(top: 500):EdgeInsets.only(top: 290),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        // Number of items in the carousel
                        3,
                            (index) {
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index ? Colors.deepPurple : Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ]
            ),
          ),
          SizedBox(height: 20,),
          Container(alignment:Alignment.topLeft,padding:EdgeInsets.only(left: 20),child: Text("Announcements 📌",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,color: Colors.deepPurple),)),
          SizedBox(height: 10,),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.deepPurple,
                        width: 2
                    )
                ),
                child: Padding(padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),child: Text("Bab-e-Ilm is the educational app and it is created by Burhan Shaikh. Soon we will upload lectures on this app.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),maxLines: 3,)),
              )
          ),
          SizedBox(height: 20,),
          Container(alignment:Alignment.topLeft,padding:EdgeInsets.only(left: 20),child: Text("Notes Shortcuts ❤",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,color: Colors.deepPurple),)),
          SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 20,),
                Container(
                  height: 160,
                  width: 200,
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(120),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff0b001c),
                            Color(0xff4803f8),

                          ]
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Physics",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18,color: Colors.white),),
                      Text("Notes",style: TextStyle(fontSize: 18,color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  height: 160,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(120),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff9b4700),
                            Color(0xffd07e03),

                          ]
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Chemistry",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18,color: Colors.white),),
                      Text("Notes",style: TextStyle(fontSize: 18,color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  height: 160,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(120),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff420957),
                            Color(0xff730093),
                          ]
                      )
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("English",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18,color: Colors.white),),
                      Text("Notes",style: TextStyle(fontSize: 18,color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  height: 160,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(120),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff004f01),
                            Color(0xff1faf5b),
                          ]
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("اردو",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30,color: Colors.white,fontFamily: "jameel"),),
                      Text("نوٹس",style: TextStyle(fontSize: 26,color: Colors.white,fontFamily: 'jameel'),),
                    ],
                  ),
                ),
                SizedBox(width: 20,)
              ],
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    ),
);
  }
}
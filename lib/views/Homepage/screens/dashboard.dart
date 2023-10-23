import 'package:bab_e_ilm/views/Auth/screens/login_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Auth/firebase_services/storingName.dart';
class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  UserInfoFireStore userInfo = UserInfoFireStore();

  @override
  Widget build(BuildContext context) {
    var info = GetInfo.info;
    return SingleChildScrollView(
      child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text("HI, ${info != null? "${info["fullName"]}":"burhan"} 👋🏽",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,color: Colors.deepPurple),),

              ],
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              child: TextField(
                cursorColor: Colors.deepPurple,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  hintText: "search",
                  suffixIcon: Icon(Icons.search,color: Colors.deepPurple,),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(30)
                  )
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
                    'assets/8.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/3.jpg',
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
              padding: Device.orientation == Orientation.portrait?EdgeInsets.only(top: 150):EdgeInsets.only(top: 290),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff038bbf),
                            Color(0xff16bcfc),
                            Color(0xff05a2ea),
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
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xffe56d0e),
                                Color(0xffe56d0e),
                                Color(0xff9d4301),
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
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffdf07a0),
                            Color(0xffc20291),
                            Color(0xffa403b0),
                          ]
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("English",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18,color: Colors.white),),
                          Text("Notes",style: TextStyle(fontSize: 18,color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff04de09),
                                Color(0xff03c407),
                                Color(0xff018602),
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
                  )
                ],
              ),
            ),
            SizedBox(height: 20,)
          ],
      ),
    );
  }
}

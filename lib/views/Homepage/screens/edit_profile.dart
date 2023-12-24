import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

import '../../Auth/screens/login_screen.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  @override
  Widget build(BuildContext context) {
    var info = GetInfo.info;
    String? gradeInString = info?["grade"].toString();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){Navigator.pop(context);},borderRadius:BorderRadius.circular(30),child: Icon(Icons.arrow_back,color: Colors.white,),),
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Row(
            children: [
              Icon(Icons.settings,color: Colors.white,size: 23,),
              SizedBox(width: 5,),
              Text("Settings",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 23),)
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(MediaQuery.of(context).size.width,130)
                  )
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                    children:[
                      SizedBox(height: 30,),
                      Container(

                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 650,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 11,
                          child: Container(
                            
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20,left: 20),
                                  child: Row(
                                    children: [
                                      CircularProfileAvatar(info?['profilePic'] == null? "":info?['profilePic'],backgroundColor: Colors.blue,radius: 33,borderColor: Colors.deepPurple,borderWidth: 2,),
                                      SizedBox(width: 10,),
                                      Text(info!["fullName"],style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w900),)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Divider(),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                                  child: Text("Profile Settings",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.deepPurple,fontSize: 18),),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(left: 30,bottom: 10),
                                  child: Text("Full Name *",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.deepPurple,fontSize: 14),),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(info!["fullName"],style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.edit,color: Colors.deepPurple,)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 25,),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(left: 30,bottom: 10),
                                  child: Text("Phone Number *",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.deepPurple,fontSize: 14),),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(info["phone"]??"Not Currently Set",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.edit,color: Colors.deepPurple,)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                info['grade'] != null?SizedBox(height: 25,):SizedBox(height: 25,),
                                info['grade'] != null?Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(left: 30,bottom: 10),
                                  child: Text("Grade *",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.deepPurple,fontSize: 14),),
                                ):Container(),
                                  info["grade"] != null?Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Text(gradeInString!,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.edit,color: Colors.deepPurple,)
                                        ],
                                      )
                                    ],
                                  ),
                                ):Container(),
                                info['grade'] != null?SizedBox(height: 25,):SizedBox(height: 0,),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(left: 30,bottom: 10),
                                  child: Text("Gender *",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.deepPurple,fontSize: 14),),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(info!["gender"],style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.edit,color: Colors.deepPurple,)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 25,),
                                info["board"] != null?Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(left: 30,bottom: 10),
                                  child: Text("Board *",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.deepPurple,fontSize: 14),),
                                ):Container(),
                                info["board"] != null ?Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(info!["board"],style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.edit,color: Colors.deepPurple,)
                                        ],
                                      )
                                    ],
                                  ),
                                ):Container(),
                                info["board"] != null ? SizedBox(height : 25):Container(),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(left: 30,bottom: 10),
                                  child: Text("Date Of Birth *",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.deepPurple,fontSize: 14),),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(info!["dateOfBirth"],style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.edit,color: Colors.deepPurple,)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

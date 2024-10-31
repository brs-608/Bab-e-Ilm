import 'package:bab_e_ilm/Bloc/HomePages/user_info_bloc.dart';
import 'package:bab_e_ilm/views/widget/edit_profile_widget.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../Auth/screens/login_screen.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;
    // var info = GetInfo.info;
    // String? gradeInString = info?["grade"].toString();
    return BlocBuilder<UserInfoBloc, UserInfoState>(
  builder: (context, state) {
    if(state is UserDataState){
      var info = state.data;
      String gradeInString = info["grade"].toString();
      String formattedDate = DateFormat('d MMMM y').format(info['dateOfBirth'].toDate());
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
                                  color: brightness == Brightness.dark?Colors.black.withOpacity(0.8):Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20,left: 20),
                                      child: Row(
                                        children: [
                                          CircularProfileAvatar(info?['profilePic'] == null? "":info?['profilePic'],backgroundColor:brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.blue,radius: 33,borderColor: brightness == Brightness.dark?Color(0xffa029ff):Colors.deepPurple,borderWidth: 2,),
                                          SizedBox(width: 10,),
                                          Text(info!["fullName"],style: TextStyle(color:brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontSize: 20,fontWeight: FontWeight.w900),)
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Divider(),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                                      child: Text("Profile Settings",style: TextStyle(fontWeight: FontWeight.w900,color:brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontSize: 18),),
                                    ),
                                    EditProfileWidget(fieldName: "Full Name", fieldValue: info['fullName']),
                                    SizedBox(height: 25,),
                                    EditProfileWidget(fieldName: "Phone Number", fieldValue: info["phone"]??"Not Currently Set"),
                                    SizedBox(height: 25,),
                                    info['grade'] != null?EditProfileWidget(fieldName: "Grade", fieldValue: info['grade'].toString()):Container(),
                                    info['grade'] != null?const SizedBox(height: 25,): const SizedBox(height: 0,),
                                    EditProfileWidget(fieldName: "Gender", fieldValue: info['gender'].toString()[0].toUpperCase()+info['gender'].toString().substring(1).toLowerCase()),
                                    SizedBox(height: 25,),
                                    info["board"] != null?EditProfileWidget(fieldName: "Board", fieldValue: info['board']):Container(),
                                    info["board"] != null ? SizedBox(height : 25):Container(),
                                    EditProfileWidget(fieldName: "Date Of Birth", fieldValue: formattedDate.toString())
                                  ],
                                ),
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
    }else{
      return Container();
    }

  },
);
  }
}

import 'package:bab_e_ilm/Bloc/HomePages/user_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../Bloc/SelectedSubject/selected_subject_bloc.dart';
import '../Auth/screens/login_screen.dart';
import '../ClassLecturesNotes/class_screen.dart';
import '../Homepage/screens/classes.dart';

class SubjectWidget extends StatelessWidget {
  String subjectName;
  String subjectID;
  SubjectWidget({required this.subjectName, required this.subjectID});
  // var info = GetInfo.info;
  @override
  Widget build(BuildContext context) {
    final RegExp english = RegExp(r'^[a-zA-Z]+');
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;
    // final provider = Provider.of<SelectedSubjectProvider>(context);
    final selectedSubjectProvider = BlocProvider.of<SelectedSubjectBloc>(context);
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        if(state is UserDataState){
          final userRole = state.data["UserRole"];

          return Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 15),
              child: InkWell(
                onTap: () {
                  // provider.selectedSubject(subjectName, subjectID);
                  selectedSubjectProvider.add(SelectedSubEvent(subjectName, subjectID));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ClassScreen()));
                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:brightness == Brightness.dark?Color(0xffa029ff):Colors.deepPurple, width: 2)),
                  child: Row(
                    mainAxisAlignment:english.hasMatch(subjectName)?MainAxisAlignment.start:MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      english.hasMatch(subjectName)?Icon(
                        Icons.school,
                        color:brightness == Brightness.dark?Color(0xffeceaf5):
                      Colors.deepPurple,
                      ):Container(),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$subjectName ${english.hasMatch(subjectName)?"Class":"کلاس"}",
                        style: english.hasMatch(subjectName)?TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color:brightness == Brightness.dark?Color(0xffeceaf5):
                            Colors.deepPurple):TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            wordSpacing: 7,
                            color:brightness == Brightness.dark?Color(0xffeceaf5):
                            Colors.deepPurple,fontFamily: "jameel"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      userRole == "teacher"
                          ? Text(
                        "$subjectID",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.deepPurple),
                      )
                          : userRole == "admin"
                          ? Text(
                        "$subjectID",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color:brightness == Brightness.dark?Color(0xffeceaf5):
                            Colors.deepPurple),
                      )
                          : Container(),english.hasMatch(subjectName)==false?Icon(
                        Icons.school,
                        color:brightness == Brightness.dark?Color(0xffeceaf5):
                        Colors.deepPurple,
                      ):Container(),
                      SizedBox(width: 15,)
                    ],
                  ),
                ),
              ));
        }else{
          return Container();
        }

      },
    );
  }
}

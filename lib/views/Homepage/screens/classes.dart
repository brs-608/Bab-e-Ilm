import 'package:bab_e_ilm/views/Auth/firebase_services/storingName.dart';
import 'package:bab_e_ilm/views/Auth/screens/login_screen.dart';
import 'package:bab_e_ilm/views/ClassLecturesNotes/class_screen.dart';
import 'package:bab_e_ilm/views/widget/subject_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedClass {
  static String? sclass;
}
class SelectedGroup{
  static String? groupID;
}
class Classes extends StatefulWidget {
  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var info = GetInfo.info;
    final userGrade = info!["grade"];
    final userRole = info["UserRole"];
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("groups").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No groups available.',style: GoogleFonts.poppins(fontWeight: FontWeight.w900,fontSize: 16),));
        }

        final groupDocs = snapshot.data!.docs;

        final groupWidgets = groupDocs
            .where((doc) {
          final subjectID = doc["subjectID"] as String;
          return subjectID.endsWith(userGrade.toString());
        })
            .map((doc) {
          final groupName = doc["groupName"] as String;
          final subjectID = doc["subjectID"] as String;
          return SubjectWidget(subjectName: groupName,subjectID: subjectID,);
        })
            .toList();
        final groupWidgets1 = groupDocs.map((doc) {
          final groupName1 = doc["groupName"] as String;
          final subjectID1 = doc["subjectID"] as String;
          return SubjectWidget(subjectName: groupName1,subjectID: subjectID1,);
        }).toList();
        if (userRole == "teacher" || userRole == "admin") {
          // If the user is a teacher or admin, show all groups without filtering by grade.
          return SingleChildScrollView(
            child: Column(
              children: groupWidgets1,
            ),
          );
        } else if (groupWidgets.isEmpty && userRole == "student"||userGrade == null) {
          return Center(child: Text('No groups available for your grade.',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w900),));
        }else if(userGrade!= null && userRole == "student"){
          return SingleChildScrollView(
            child: Column(
              children: groupWidgets,
            ),
          );
        }
      return Container();
      },
    );

  }
}

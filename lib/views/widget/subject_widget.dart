import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/selectedSubject.dart';
import '../Auth/screens/login_screen.dart';
import '../ClassLecturesNotes/class_screen.dart';
import '../Homepage/screens/classes.dart';

class SubjectWidget extends StatelessWidget {
 String subjectName;
 String? subjectID;
 SubjectWidget({required this.subjectName,this.subjectID});
 var info = GetInfo.info;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SelectedSubjectProvider>(context);
    final userRole = info!["UserRole"];
    return Container(
        padding: EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 15),
        child: InkWell(
          onTap: (){
            provider.selectedSubject(subjectName, subjectID);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ClassScreen()));
          },
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.deepPurple,
                    width: 2
                )
            ),
            child: Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.school,color: Colors.deepPurple,),
                SizedBox(width: 10,),
                Text("$subjectName Class",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),),
                SizedBox(width: 10,),
                userRole == "teacher"?
                    Text("$subjectID",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),):
                userRole == "admin"?Text(
                  "$subjectID",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),):
                Container()
              ],
            ),
          ),
        )
    );
  }
}

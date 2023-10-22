import 'package:bab_e_ilm/provider/selectedSubject.dart';
import 'package:bab_e_ilm/views/ClassLecturesNotes/class_room.dart';
import 'package:bab_e_ilm/views/ClassLecturesNotes/firebase/lectures.dart';
import 'package:bab_e_ilm/views/Homepage/screens/classes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SelectedSubjectProvider>(context);
    return DefaultTabController(
        length: 3, child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("${provider.subjectName} Class",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w900),),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(text: 'Class',icon: Icon(FontAwesomeIcons.school),),
            Tab(text: 'Lectures',icon:Icon(FontAwesomeIcons.video)),
            Tab(text:'Notes',icon:Icon(FontAwesomeIcons.book)),
          ],
        ),
      ),
          body: TabBarView(
            children: [
            ClassRoom(),
            Lectures(),
            Container(),
        ],
      ),
    )
    );
  }
}

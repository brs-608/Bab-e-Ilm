import 'package:bab_e_ilm/Bloc/SelectedSubject/selected_subject_bloc.dart';
import 'package:bab_e_ilm/views/ClassLecturesNotes/class_room.dart';
import 'package:bab_e_ilm/views/ClassLecturesNotes/lectures.dart';
import 'package:bab_e_ilm/views/Homepage/screens/classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis/shared.dart';
import 'package:provider/provider.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SelectedSubjectProvider>(context);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: BlocBuilder<SelectedSubjectBloc, SelectedSubjectState>(
              builder: (context, state) {
                if(state is SelectedSubState){
                  return Text(
                    "${state.subjectName} Class ${state.subjectId[state.subjectId.length - 1]}",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  );
                }else{
                  return Text("");
                }

              },
            ),
            leading: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            centerTitle: true,
            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Class',
                  icon: Icon(
                    FontAwesomeIcons.school,
                    color: Colors.white,
                  ),
                ),
                Tab(
                    text: 'Lectures',
                    icon: Icon(
                      FontAwesomeIcons.video,
                      color: Colors.white,
                    )),
                Tab(
                    text: 'Notes',
                    icon: Icon(
                      FontAwesomeIcons.book,
                      color: Colors.white,
                    )),
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
        ));
  }
}

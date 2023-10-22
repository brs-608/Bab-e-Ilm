import 'package:bab_e_ilm/provider/videoPlayer.dart';
import 'package:bab_e_ilm/views/VideoPlayer/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Lectures extends StatefulWidget {
  const Lectures({super.key});

  @override
  State<Lectures> createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VideoPlayerState>(context);
    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),child: Text("Physics Lectures for Class 9",style: GoogleFonts.poppins(fontWeight: FontWeight.w800,fontSize: 20),)),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("lecturePhysics9").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No Chats yet!', style: GoogleFonts.poppins(fontWeight: FontWeight.w900, fontSize: 16),));
              }

              final messageDocs = snapshot.data!.docs;

              return ListView(
                children: messageDocs.reversed.map((doc) {
                  final data = doc.data() as Map<String,dynamic>;
                  String title = data["title"] as String;
                  String thumbnail = data["thumbnailURL"] as String;
                  String video = data["videoURL"] as String;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      elevation: 11,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        height: 180,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: InkWell(
                              onTap: (){
                                provider.lectureLink(video,title);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoPlayerScreen(link: video.toString(),)));
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  Image.network(thumbnail,fit: BoxFit.cover,width: double.infinity,height: 180,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 130),
                                      child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 18,),))
                                ],
                              ),
                            )),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

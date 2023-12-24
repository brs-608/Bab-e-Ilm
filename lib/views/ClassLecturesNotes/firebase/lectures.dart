import 'package:bab_e_ilm/provider/likes_dislike_provider.dart';
import 'package:bab_e_ilm/provider/selectedSubject.dart';
import 'package:bab_e_ilm/provider/videoPlayer.dart';
import 'package:bab_e_ilm/views/Auth/screens/login_screen.dart';
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

    var info = GetInfo.info;
    final provider = Provider.of<VideoPlayerState>(context);
    final subjectProvider = Provider.of<SelectedSubjectProvider>(context);
    final likeDislikeProvider = Provider.of<LikeDislike>(context);
    Stream<QuerySnapshot> lectures() {
      String? group = subjectProvider.subjectID;
      var stream;
      switch (group){
        case "physics9":
          return stream = FirebaseFirestore.instance.collection("lecturePhysics9").snapshots();
        case "chemistry9":
          return stream = FirebaseFirestore.instance.collection("lectureChemistry9").snapshots();
        case "islamiyat9":
          return stream = FirebaseFirestore.instance.collection("lectureIslamiyat9").snapshots();
        case "urdu9":
          return stream = FirebaseFirestore.instance.collection("lectureUrdu9").snapshots();
        case "computer9":
          return stream = FirebaseFirestore.instance.collection("lectureComputer9").snapshots();
        case "english9":
          return stream = FirebaseFirestore.instance.collection("lectureEnglish9").snapshots();
        case "math9":
          return stream = FirebaseFirestore.instance.collection("lectureMath9").snapshots();
        case "physics10":
          return stream = FirebaseFirestore.instance.collection("lecturePhysics10").snapshots();
        case "chemistry10":
          return stream = FirebaseFirestore.instance.collection("lectureChemistry10").snapshots();
        case "sindhi10":
          return stream = FirebaseFirestore.instance.collection("lectureSindhi10").snapshots();
        case "pst10":
          return stream = FirebaseFirestore.instance.collection("lecturePST10").snapshots();
        case "computer10":
          return stream = FirebaseFirestore.instance.collection("lectureComputer10").snapshots();
        case "english10":
          return stream = FirebaseFirestore.instance.collection("lectureEnglish10").snapshots();
        case "math10":
          return stream = FirebaseFirestore.instance.collection("lectureMath10").snapshots();
        case "physics11":
          return stream = FirebaseFirestore.instance.collection("lecturePhysics11").snapshots();
        case "chemistry11":
          return stream = FirebaseFirestore.instance.collection("lectureChemistry11").snapshots();
        case "islamiyat11":
          return stream = FirebaseFirestore.instance.collection("lectureIslamiyat11").snapshots();
        case "urdu11":
          return stream = FirebaseFirestore.instance.collection("lectureUrdu11").snapshots();
        case "computer11":
          return stream = FirebaseFirestore.instance.collection("lectureComputer11").snapshots();
        case "english11":
          return stream = FirebaseFirestore.instance.collection("lectureEnglish11").snapshots();
        case "math11":
          return stream = FirebaseFirestore.instance.collection("lectureMath11").snapshots();

        default:
          print("no groups found");
      }
      return stream;
    }
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5,vertical: 10
            ),
            child: Text(
              "${subjectProvider.subjectName} Lectures for Class ${subjectProvider.subjectID.endsWith("9")?"9":subjectProvider.subjectID.endsWith("10")?"10":subjectProvider.subjectID.endsWith("11")?"11":subjectProvider.subjectID.endsWith("12")?"12":""}",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w800,fontSize: 20),
              )
          ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: lectures(),
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
                return Center(child: Text('No Lectures yet!', style: GoogleFonts.poppins(fontWeight: FontWeight.w900, fontSize: 16),));
              }

              final lecturesDocs = snapshot.data!.docs;

              return ListView(
                children: lecturesDocs.reversed.map((doc) {
                  final data = doc.data() as Map<String,dynamic>;
                  String title = data["title"] as String;
                  String thumbnail = data["thumbnailURL"] as String;
                  String video = data["videoURL"] as String;
                  List likes = data["likes"] as List;
                  List dislikes = data["dislikes"] as List;

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
                                if(likes.contains(info!["email"])){
                                    likeDislikeProvider.isLike();
                                }else if(dislikes.contains(info!["email"])){
                                  likeDislikeProvider.isDislike();
                                }else{
                                  likeDislikeProvider.likeDefault();
                                }
                                provider.lectureLink(video,title);
                                print(video);
                                likeDislikeProvider.setLikes(likes.length);
                                likeDislikeProvider.setDislikes(dislikes.length);
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

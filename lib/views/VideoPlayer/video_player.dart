

import 'package:bab_e_ilm/provider/likes_dislike_provider.dart';
import 'package:bab_e_ilm/provider/selectedSubject.dart';
import 'package:bab_e_ilm/provider/videoPlayer.dart';
import 'package:chewie/chewie.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import '../Auth/screens/login_screen.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart';
import 'dart:async';
import 'dart:convert';



class VideoPlayerScreen extends StatefulWidget {
  String link;
  VideoPlayerScreen({required this.link});
  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

  late VideoPlayerController videoPlayerController ;

  @override
  void initState() {
    // TODO: implement initState
  _initPlayer();

  }
  void _initPlayer()async{
    videoPlayerController= VideoPlayerController.networkUrl(Uri.parse(widget.link,));
    await videoPlayerController.initialize();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    bool comment = false;
    final provider = Provider.of<VideoPlayerState>(context);
    final groupID = Provider.of<SelectedSubjectProvider>(context);
    final videoLink = provider.videoLink;
    final likeDislikeProvider = Provider.of<LikeDislike>(context,listen: false);
    var info = GetInfo.info;
    String groupName() {
      String group = groupID.subjectID;
      String nameOfGroup;
      switch (group){
        case "physics9":
          return nameOfGroup = "lecturePhysics9";
        case "chemistry9":
          return nameOfGroup = "lectureChemistry9";
        case "islamiyat9":
          return nameOfGroup = "lectureIslamiyat9";
        case "urdu9":
          return nameOfGroup = "lectureUrdu9";
        case "computer9":
          return nameOfGroup = "lectureComputer9";
        case "english9":
          return nameOfGroup = "lectureEnglish9";
        case "math9":
          return nameOfGroup = "lectureMath9";
        case "physics10":
          return nameOfGroup = "lecturePhysics10";
        case "chemistry10":
          return nameOfGroup = "lectureChemistry10";
        case "sindhi10":
          return nameOfGroup = "lectureSindhi10";
        case "pst10":
          return nameOfGroup = "lecturePST10";
        case "computer10":
          return nameOfGroup = "lectureComputer10";
        case "english10":
          return nameOfGroup = "lectureEnglish10";
        case "math10":
          return nameOfGroup = "lectureMath10";
        case "physics11":
          return nameOfGroup = "lecturePhysics11";
        case "chemistry11":
          return nameOfGroup = "lectureChemistry11";
        case "islamiyat11":
          return nameOfGroup = "lectureIslamiyat11";
        case "urdu11":
          return nameOfGroup = "lectureUrdu11";
        case "computer11":
          return nameOfGroup = "lectureComputer11";
        case "english11":
          return nameOfGroup = "lectureEnglish11";
        case "math11":
          return nameOfGroup = "lectureMath11";

        default:
          print("no groups found");
      }
      return nameOfGroup = "";
    }
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
              videoPlayerController.value.isPlaying == true? Icons.pause:Icons.play_arrow
          ),
          onPressed: (){
            setState(() {

            });
            if(videoPlayerController.value.isPlaying){
              videoPlayerController.pause();
            }else{
              videoPlayerController.play();
            }
          },
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
               Container(
                 height: 200,
                   width: double.infinity,
                   child: VideoPlayer(
                       videoPlayerController)),

                comment == true? Container():Column(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                          padding:EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                          alignment:Alignment.topLeft,
                          child: Row(
                            children: [
                              Text(provider.videoTitle,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w900),),
                            ],
                          )),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: (){
                            likeDislikeProvider.isLike();
                              likeDislikeProvider.likeVideo(provider.videoTitle, info!["email"], groupName());
                          },
                          child: Consumer<LikeDislike>(builder: (context,value,child){
                            return Container(
                                padding: value.likes == 0 ?EdgeInsets.symmetric(vertical: 5,horizontal: 10):EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: value.isLiked == true? Colors.black:Colors.transparent,
                                    border: Border.all(
                                        color: value.isLiked == true? Colors.transparent:Colors.black.withOpacity(0.8)
                                    )
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.thumb_up_off_alt,color: value.isLiked == true? Colors.white:Colors.black),
                                    SizedBox(width: 5,),
                                    Consumer<LikeDislike>(builder: (context,value,child){
                                      return Text("${value.likes == 0?"Like":value.likes}",style: GoogleFonts.poppins(color: value.isLiked == true?Colors.white:Colors.black,fontWeight: FontWeight.w600),);

                                    })
                                  ],
                                ));
                          }),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: (){
                            likeDislikeProvider.isDislike();
                            likeDislikeProvider.dislikeVideo(provider.videoTitle, info!["email"], groupName());
                          },
                          child: Consumer<LikeDislike>(builder: (context,value,child){
                            return Container(
                                padding: value.dislikes == 0 ?EdgeInsets.symmetric(vertical: 5,horizontal: 10):EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: value.isDisliked == true? Colors.black:Colors.transparent,
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.8)
                                    )
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.thumb_down_off_alt,color: value.isDisliked == true? Colors.white:Colors.black,),
                                    SizedBox(width: 5,),
                                    Consumer<LikeDislike>(builder: (context,value,child){
                                      return Text("${value.dislikes == 0?"Dislike":value.dislikes}",style: GoogleFonts  .poppins(color: value.isDisliked == true ?Colors.white:Colors.black,fontWeight: FontWeight.w600),);

                                    })
                                  ],
                                ));
                          })
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: (){},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.8)
                              )
                            ),
                              child: Row(
                                children: [
                                  Icon(Icons.save_alt),
                                  SizedBox(width: 5,),
                                  Text("Save",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600),)
                                ],
                              )),
                        ),

                      ],
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Ask Questions!",style: GoogleFonts.poppins(fontWeight: FontWeight.w900,fontSize: 18),),
                                Icon(Icons.arrow_drop_up,color: Colors.black,)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircularProfileAvatar(
                                  info?['profilePic'] == null?"":info!["profilePic"],
                                  radius: 15,
                                ),
                                SizedBox(width: 10,),
                                Expanded(child: Text("Any doubt about this lecture? You wanna ask questions?",style: TextStyle(fontSize: 14),maxLines: 2,overflow: TextOverflow.ellipsis,))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
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
                          return Center(child: Text('No Lectures yet!', style: GoogleFonts.poppins(fontWeight: FontWeight.w900, fontSize: 16),));
                        }

                        final messageDocs = snapshot.data!.docs;

                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Column(
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
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> VideoPlayerScreen(link: video.toString(),)));
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
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

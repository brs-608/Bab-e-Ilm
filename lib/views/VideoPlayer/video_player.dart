import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:bab_e_ilm/Bloc/HomePages/user_info_bloc.dart';
import 'package:bab_e_ilm/Bloc/LikeDislike/like_dislike_bloc.dart';
import 'package:bab_e_ilm/Bloc/SelectedSubject/selected_subject_bloc.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';
import 'package:intl/intl.dart';
class VideoPlayerScreen extends StatefulWidget {
  String link;
  String thumbnailLink;
  VideoPlayerScreen({required this.link, required this.thumbnailLink});
  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController chewieController = CustomVideoPlayerController(videoPlayerController: videoPlayerController, context: context,customVideoPlayerSettings: CustomVideoPlayerSettings(customAspectRatio: 16/9,));
  @override
  void initState() {
    // TODO: implement initState
    _initPlayer();
  }

  void _initPlayer() async {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.link));
    await videoPlayerController.initialize().then((value) {
      setState(() {});
    });
    chewieController = CustomVideoPlayerController(
        videoPlayerController: videoPlayerController, context: context,customVideoPlayerSettings: CustomVideoPlayerSettings(customAspectRatio: 16/9));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
    chewieController.dispose();

    super.dispose();
  }
  // void detectLanguage(String text) async {
  //   LanguageDetector detector = LanguageDetector();
  //   String language = await detector.detectLanguage(text);
  //
  //   print('Detected language: $language');
  // }

    @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    String languageCode = locale.languageCode;
    final RegExp english = RegExp(r'^[a-zA-Z]+');
    // final provider = Provider.of<VideoPlayerState>(context);
    // final groupID = Provider.of<SelectedSubjectProvider>(context);
    // final likeDislikeProvider = Provider.of<LikeDislike>(context,listen: false);
    // var info = GetInfo.info;
    bool comment = true;
    final likeDislikeProvider = BlocProvider.of<LikeDislikeBloc>(context);
    final userInfoProvider = BlocProvider.of<UserInfoBloc>(context);
    return BlocBuilder<SelectedSubjectBloc, SelectedSubjectState>(
      builder: (context, state) {
        print(languageCode);
        if (state is SelectedSubState) {
          String groupName() {
            String group = state.subjectId;
            String nameOfGroup;
            switch (group) {
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

          return BlocBuilder<UserInfoBloc, UserInfoState>(
            builder: (context, state) {
              if (state is UserDataState) {

                final info = state.data;
                final String email = state.data["email"];
                return SafeArea(
                  child: Scaffold(
                    body: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: Device.screenType == ScreenType.mobile
                                  ? 203
                                  : 800,
                              color: Colors.black,
                              child: Stack(
                                children: [
                                  Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.white,
                                  )),
                                  Center(
                                    child: CustomVideoPlayer(
                                      customVideoPlayerController:
                                          chewieController,

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          state.data["comment"] == true? Container(
                            height: 400,
                            width: double.infinity,
                            child: InkWell(
                              onTap: (){
                                userInfoProvider.add(CommentInfoFalse(state.data["email"]));
                              },
                              child: Card(
                                elevation: 11,
                              ),
                            ),
                          ):
                          Column(
                      children: [
                      InkWell(
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              BlocBuilder<LikeDislikeBloc,
                                  LikeDislikeState>(
                                builder: (context, state) {
                                  if (state is LikDisState) {
                                    return Container(
                                      alignment: english.hasMatch(state.videoData["videoTitle"])==false?Alignment.centerRight:Alignment.centerLeft,
                                      child: Text(
                                        "${state.videoData["videoTitle"]}",
                                        maxLines: 2,
                                        style: english.hasMatch(state.videoData["videoTitle"]) == false? const TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w900,fontFamily:"jameel"):GoogleFonts.poppins(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900,)
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      "abc vide title",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight:
                                          FontWeight
                                              .w900),
                                    );
                                  }
                                },
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    BlocBuilder<LikeDislikeBloc,
                        LikeDislikeState>(
                      builder: (context, state) {
                        if (state is LikDisState) {
                          return Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                borderRadius:
                                BorderRadius.circular(30),
                                onTap: () {
                                  // likeDislikeProvider.isLike();
                                  //   likeDislikeProvider.likeVideo(provider.videoTitle, info!["email"], groupName());
                                  likeDislikeProvider.add(LikeEvent(state.videoData["videoTitle"].toString(), email, groupName(), state.videoData["videoTitle"]));
                                },
                                child: Container(
                                    padding: state.videoData["likeCount"] == 0 ?EdgeInsets.symmetric(vertical: 5,horizontal: 10):EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                    // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        // color: value.isLiked == true? Colors.black:Colors.transparent,
                                        color: state.isLiked==true?Colors.black:Colors.transparent,
                                        border: Border.all(
                                          color: state.isLiked == true? Colors.transparent:Colors.black.withOpacity(0.8),)),
                                    // color: Colors
                                    //     .black
                                    //     .withOpacity(
                                    //         0.8))),
                                    child: Row(
                                      children: [
                                        // Icon(Icons.thumb_up_off_alt,color: value.isLiked == true? Colors.white:Colors.black),
                                        Icon(
                                            Icons.thumb_up_off_alt,
                                            color: state.isLiked==true?Colors.white:Colors.black),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        // Text("dsfdf",style: GoogleFonts.poppins(color: value.isLiked == true?Colors.white:Colors.black,fontWeight: FontWeight.w600),)
                                        Text(state.videoData["likeCount"] != 0?"${state.videoData["likeCount"]}":"Like", style: GoogleFonts.poppins(color: state.isLiked == true?Colors.white:Colors.black, fontWeight: FontWeight.w600),)
                                      ],
                                    )),
                              ),
                              InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: () {
                                    // likeDislikeProvider.isDislike();
                                    // likeDislikeProvider.dislikeVideo(provider.videoTitle, info!["email"], groupName());
                                    likeDislikeProvider.add(DislikeEvent(state.videoData["videoTitle"], email, groupName(), state.videoData["videoTitle"]));
                                  },
                                  child: Container(
                                      padding: state.videoData["dislikeCount"] == 0 ?EdgeInsets.symmetric(vertical: 5,horizontal: 10):EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                      // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10,),
                                      decoration:
                                      BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: state.isDisliked == true? Colors.black:Colors.transparent,
                                          // color: Colors
                                          //     .transparent,
                                          border: Border.all(color: state.isDisliked == true?Colors.transparent:Colors.black.withOpacity(0.8))),
                                      child: Row(
                                        children: [
                                          // Icon(Icons.thumb_down_off_alt,color: value.isDisliked == true? Colors.white:Colors.black,),
                                          Icon(Icons.thumb_down_off_alt, color: state.isDisliked==true?Colors.white:Colors.black,),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          // Text("${value.dislikes == 0?"Dislike":value.dislikes}",style: GoogleFonts  .poppins(color: value.isDisliked == true ?Colors.white:Colors.black,fontWeight: FontWeight.w600),)
                                          Text(state.videoData["dislikeCount"] != 0 ?"${state.videoData["dislikeCount"]}":"Dislike", style: GoogleFonts.poppins(color: state.isDisliked?Colors.white:Colors.black, fontWeight: FontWeight.w600),)
                                        ],
                                      ))),
                              InkWell(
                                borderRadius:
                                BorderRadius.circular(30),
                                onTap: () {},
                                child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(color: Colors.black.withOpacity(0.8))),
                                    child: Row(
                                      children: [
                                        Icon(Icons.save_alt),
                                        SizedBox(width: 5,),
                                        Text("Save", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w600),)
                                      ],
                                    )),
                              ),
                            ],
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {
                                  // likeDislikeProvider.isLike();
                                  //   likeDislikeProvider.likeVideo(provider.videoTitle, info!["email"], groupName());
                                },
                                child: Container(
                                  // padding: value.likes == 0 ?EdgeInsets.symmetric(vertical: 5,horizontal: 10):EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        // color: value.isLiked == true? Colors.black:Colors.transparent,
                                        color: Colors.transparent, border: Border.all(
                                      // color: value.isLiked == true? Colors.transparent:Colors.black.withOpacity(0.8)
                                        color: Colors.black.withOpacity(0.8))),
                                    child: Row(
                                      children: [
                                        // Icon(Icons.thumb_up_off_alt,color: value.isLiked == true? Colors.white:Colors.black),
                                        Icon(Icons.thumb_up_off_alt, color: Colors.black),
                                        SizedBox(width: 5,),
                                        // Text("dsfdf",style: GoogleFonts.poppins(color: value.isLiked == true?Colors.white:Colors.black,fontWeight: FontWeight.w600),)
                                        Text("Like", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w600),)
                                      ],
                                    )),
                              ),
                              InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: () {
                                    // likeDislikeProvider.isDislike();
                                    // likeDislikeProvider.dislikeVideo(provider.videoTitle, info!["email"], groupName());
                                  },
                                  child: Container(
                                    // padding: value.dislikes == 0 ?EdgeInsets.symmetric(vertical: 5,horizontal: 10):EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10,
                                      ),
                                      decoration:
                                      BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          // color: value.isDisliked == true? Colors.black:Colors.transparent,
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.black.withOpacity(0.8))),
                                      child: Row(
                                        children: [
                                          // Icon(Icons.thumb_down_off_alt,color: value.isDisliked == true? Colors.white:Colors.black,),
                                          Icon(
                                            Icons
                                                .thumb_down_off_alt,
                                            color:
                                            Colors.black,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          // Text("${value.dislikes == 0?"Dislike":value.dislikes}",style: GoogleFonts  .poppins(color: value.isDisliked == true ?Colors.white:Colors.black,fontWeight: FontWeight.w600),)
                                          Text(
                                            "Dislike",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ))),
                              InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {},
                                child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: Colors.black.withOpacity(0.8))),
                                    child: Row(
                                      children: [
                                        Icon(Icons.save_alt),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Save",
                                          style: GoogleFonts
                                              .poppins(
                                              color: Colors
                                                  .black,
                                              fontWeight:
                                              FontWeight
                                                  .w600),
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        userInfoProvider.add(CommentInfoTrue(state.data["email"]));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                  "Ask Questions!",
                                  style: GoogleFonts.poppins(
                                      fontWeight:
                                      FontWeight.w900,
                                      fontSize: 18),
                                ),
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                CircularProfileAvatar(
                                  info['profilePic'] == null ? "" : info["profilePic"],
                                  radius: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Text(
                                      "Any doubt about this lecture? You wanna ask questions?",
                                      style:
                                      TextStyle(fontSize: 14),
                                      maxLines: 2,
                                      overflow:
                                      TextOverflow.ellipsis,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection("lecturePhysics9").snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(
                              child: Text('No Lectures yet!', style: GoogleFonts.poppins(fontWeight: FontWeight.w900, fontSize: 16),
                              ));
                        }

                        final messageDocs = snapshot.data!.docs;
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: messageDocs.map((doc) {
                              final data = doc.data() as Map<String, dynamic>;
                              String title = data["title"] as String;
                              String thumbnail = data["thumbnailURL"] as String;
                              String video = data["videoURL"] as String;

                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Card(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  elevation: 11,
                                  shape:
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          10)),
                                  child: Container(
                                    height: 180,
                                    width: double.infinity,
                                    child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius
                                                .circular(
                                                10)),
                                        child: InkWell(
                                          onTap: () {
                                            // provider.lectureLink(video,title,thumbnail.toString());
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => VideoPlayerScreen(
                                                      link:
                                                      video.toString(),
                                                      thumbnailLink:
                                                      thumbnail.toString(),
                                                    )));
                                          },
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              10),
                                          child: Stack(
                                            children: [
                                              Image.network(
                                                thumbnail,
                                                fit: BoxFit
                                                    .cover,
                                                width: double
                                                    .infinity,
                                                height: 180,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left:
                                                      10,
                                                      right:
                                                      10,
                                                      top:
                                                      130),
                                                  child: Text(
                                                    title,
                                                    style:
                                                    TextStyle(
                                                      color: Colors
                                                          .white,
                                                      fontWeight:
                                                      FontWeight.w800,
                                                      fontSize:
                                                      18,
                                                    ),
                                                  ))
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
                  ),

                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}

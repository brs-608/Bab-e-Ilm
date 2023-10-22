import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:bab_e_ilm/provider/videoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  String link;
  VideoPlayerScreen({required this.link});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

  late CustomVideoPlayerController _customVideoPlayerController;
  late YoutubePlayerController _youtubePlayerController;
  double volume = 1.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(widget.link);
    _youtubePlayerController = YoutubePlayerController(initialVideoId: videoID!,flags: YoutubePlayerFlags(autoPlay: false,),);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VideoPlayerState>(context);
    final videoLink = provider.videoLink;
    print(videoLink);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Bab-e-Ilm Lectures"),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.deepPurple,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayer(
                controller: _youtubePlayerController,
              bottomActions: [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                  colors: ProgressBarColors(
                    playedColor: Colors.deepPurple,
                    handleColor: Colors.deepPurpleAccent
                  ),
                ),
                FullScreenButton(
                  controller: _youtubePlayerController,
                )
              ],
            ),
            Container(padding:EdgeInsets.symmetric(horizontal: 15,vertical: 20),alignment:Alignment.topLeft,child: Text(provider.videoTitle,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w900),))
          ],
        ),
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:bab_e_ilm/views/ClassLecturesNotes/class_screen.dart';
// import 'package:flutter/services.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class VideoCallScreen extends StatefulWidget {
//   const VideoCallScreen({super.key});
//
//   @override
//   State<VideoCallScreen> createState() => _VideoCallScreenState();
// }
//
// const appID = "e8161ac76e6749ddba6fc88b07212f1a";
// const appCertificate = "9399bcc17908489e8741f3d55f573d9f";
// const channelName = "physics12";
// const token = "007eJxTYJhdL718Sud2OW5lt7/u3tVNlgxHVsw12yGlHPrD8f0UZm4FhlQLQzPDxGRzs1QzcxPLlJSkRLO0ZAuLJANzI0OjNMPEbGPDtIZARgbeZ+sZGKEQxOdkKMioLM5MLjY0YmAAACXTHn4=";
//
// class _VideoCallScreenState extends State<VideoCallScreen> {
//   int? _remoteUid;
//   bool _localUserJoined = false;
//   late RtcEngine _engine;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initAgora();
//   }
//   Future<void> initAgora() async {
//     // retrieve permissions
//     await [Permission.microphone, Permission.camera].request();
//
//     //create the engine
//     _engine = createAgoraRtcEngine();
//     await _engine.initialize(const RtcEngineContext(
//       appId: appID,
//       channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//     ));
//
//     _engine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//           debugPrint("local user ${connection.localUid} joined");
//           setState(() {
//             _localUserJoined = true;
//           });
//         },
//         onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//           debugPrint("remote user $remoteUid joined");
//           setState(() {
//             _remoteUid = remoteUid;
//           });
//         },
//         onUserOffline: (RtcConnection connection, int remoteUid,
//             UserOfflineReasonType reason) {
//           debugPrint("remote user $remoteUid left channel");
//           setState(() {
//             _remoteUid = null;
//           });
//         },
//         onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
//           debugPrint(
//               '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
//         },
//       ),
//     );
//
//     await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//     await _engine.enableVideo();
//     await _engine.startPreview();
//
//     await _engine.joinChannel(
//       token: token,
//       channelId: channelName,
//       uid: 0,
//       options: const ChannelMediaOptions(),
//     );
//   }
//
//   @override
//   void dispose() {
//
//     // TODO: implement dispose
//     super.dispose();
//     _dispose();
//   }
//   Future<void> _dispose() async {
//     await _engine.leaveChannel();
//     await _engine.release();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         body: Stack(
//           children: [
//             Column(
//               children: [
//                 Expanded(
//                     child: Container(
//                       color: Colors.blue,
//                       child: Center(child: _remoteVideo(),),)),
//                 Expanded(child: Container(color: Colors.green,child: Center(child: _localUserJoined
//                     ? AgoraVideoView(
//                   controller: VideoViewController(
//                     rtcEngine: _engine,
//                     canvas: const VideoCanvas(uid: 0),
//                   ),
//                 )
//                     : const CircularProgressIndicator(color: Colors.white,),),)),
//               ],
//             ),
//             Container(
//               padding: EdgeInsets.only(bottom: 50),
//               alignment: Alignment.bottomCenter,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   IconButton(
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             Colors.black.withOpacity(0.8)
//                         )
//                     ),
//                     onPressed: (){},
//                     icon: Icon(Icons.more_horiz,size: 22,),
//                     color: Colors.white,),
//                   IconButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                         Colors.black.withOpacity(0.8)
//                       )
//                     ),
//                     onPressed: (){
//
//                     },
//                     icon: Icon(Icons.mic,size: 22,),
//                     color: Colors.white,),
//                   IconButton(
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             Colors.red
//                         )
//                     ),
//                     onPressed: (){
//                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ClassScreen()));
//                     },
//                     icon: Icon(Icons.call_end,size: 22,),
//                     color: Colors.white,),
//                   IconButton(
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             Colors.black.withOpacity(0.8)
//                         )
//                     ),
//                     onPressed: (){},
//                     icon: Icon(Icons.video_camera_front,size: 22,),
//                     color: Colors.white,),
//                   IconButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                         Colors.black.withOpacity(0.8)
//                       )
//                     ),
//                     onPressed: (){},
//                     icon: Icon(Icons.chat,size: 22,),
//                     color: Colors.white,),
//
//                 ],
//               ),
//             )
//           ],
//         ),
//     );
//   }
//   Widget _remoteVideo() {
//     if (_remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: _remoteUid),
//           connection: const RtcConnection(channelId: channelName),
//         ),
//       );
//     } else {
//       return const Text(
//         'Please wait for remote user to join',
//         textAlign: TextAlign.center,
//       );
//     }
//   }
// }
//

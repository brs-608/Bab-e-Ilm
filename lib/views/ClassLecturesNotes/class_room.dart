
import 'package:bab_e_ilm/Bloc/HomePages/user_info_bloc.dart';
import 'package:bab_e_ilm/Bloc/SelectedSubject/selected_subject_bloc.dart';
import 'package:bab_e_ilm/views/ClassLecturesNotes/messageHolder.dart';
import 'package:bab_e_ilm/views/ClassLecturesNotes/videoCall.dart';
import 'package:bab_e_ilm/views/Homepage/screens/classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Auth/screens/login_screen.dart';


class ClassRoom extends StatefulWidget {

  @override
  State<ClassRoom> createState() => _ClassRoomState();
}

class _ClassRoomState extends State<ClassRoom> {
  TextEditingController msgController = TextEditingController();


  final _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    final RegExp english = RegExp(r'^[a-zA-Z]+');

    // final provider = Provider.of<SelectedSubjectProvider>(context);
    // String? group = provider.subjectID;
    // String group = "Ali";
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;

    return BlocBuilder<UserInfoBloc, UserInfoState>(

  builder: (context, state) {
    if(state is UserDataState){
      final userName = state.data["userName"];
      return BlocBuilder<SelectedSubjectBloc,SelectedSubjectState>(
        builder: (context,state){
          if(state is SelectedSubState){
            // final userName = state.data["userName"];
            final group = state.subjectId;
            Future<void> sendMessage(String text, String sender) async {
              switch (group){
                case "physics9":
                  await FirebaseFirestore.instance.collection('messagePhysics9').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "chemistry9":
                  await FirebaseFirestore.instance.collection('messageChemistry9').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "islamiyat9":
                  await FirebaseFirestore.instance.collection('messageIslamiyat9').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "urdu9":
                  await FirebaseFirestore.instance.collection('messageUrdu9').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "computer9":
                  await FirebaseFirestore.instance.collection('messageComputer9').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "english9":
                  await FirebaseFirestore.instance.collection('messageEnglish9').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "math9":
                  await FirebaseFirestore.instance.collection('messageMath9').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "physics10":
                  await FirebaseFirestore.instance.collection('messagePhysics10').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "chemistry10":
                  await FirebaseFirestore.instance.collection('messageChemistry10').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "sindhi10":
                  await FirebaseFirestore.instance.collection('messageSindhi10').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "pst10":
                  await FirebaseFirestore.instance.collection('messagePST10').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "computer10":
                  await FirebaseFirestore.instance.collection('messageComputer10').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "english10":
                  await FirebaseFirestore.instance.collection('messageEnglish10').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "math10":
                  await FirebaseFirestore.instance.collection('messageMath10').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "physics11":
                  await FirebaseFirestore.instance.collection('messagePhysics11').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "chemistry11":
                  await FirebaseFirestore.instance.collection('messageChemistry11').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "islamiyat11":
                  await FirebaseFirestore.instance.collection('messageIslamiyat11').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "urdu11":
                  await FirebaseFirestore.instance.collection('messageUrdu11').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "computer11":
                  await FirebaseFirestore.instance.collection('messageComputer11').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "english11":
                  await FirebaseFirestore.instance.collection('messageEnglish11').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                case "math11":
                  await FirebaseFirestore.instance.collection('messageMath11').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                  case "physics12":
                  await FirebaseFirestore.instance.collection('messagePhysics12').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                  case "urdu12":
                  await FirebaseFirestore.instance.collection('messageUrdu12').doc(DateTime.now().toString()).set({
                    'text': text,
                    'sender': sender,
                    'timestamp': FieldValue.serverTimestamp(),
                  });


                default:
                  debugPrint("no groups found");
              }
            }
            Stream<QuerySnapshot> messages() {
              var stream;
              switch (group){
                case "physics9":
                  return stream = FirebaseFirestore.instance.collection("messagePhysics9").orderBy("timestamp").snapshots();
                case "chemistry9":
                  return stream = FirebaseFirestore.instance.collection("messageChemistry9").orderBy("timestamp").snapshots();
                case "islamiyat9":
                  return stream = FirebaseFirestore.instance.collection("messageIslamiyat9").orderBy("timestamp").snapshots();
                case "urdu9":
                  return stream = FirebaseFirestore.instance.collection("messageUrdu9").orderBy("timestamp").snapshots();
                case "computer9":
                  return stream = FirebaseFirestore.instance.collection("messageComputer9").orderBy("timestamp").snapshots();
                case "english9":
                  return stream = FirebaseFirestore.instance.collection("messageEnglish9").orderBy("timestamp").snapshots();
                case "math9":
                  return stream = FirebaseFirestore.instance.collection("messageMath9").orderBy("timestamp").snapshots();
                case "physics10":
                  return stream = FirebaseFirestore.instance.collection("messagePhysics10").orderBy("timestamp").snapshots();
                case "chemistry10":
                  return stream = FirebaseFirestore.instance.collection("messageChemistry10").orderBy("timestamp").snapshots();
                case "sindhi10":
                  return stream = FirebaseFirestore.instance.collection("messageSindhi10").orderBy("timestamp").snapshots();
                case "pst10":
                  return stream = FirebaseFirestore.instance.collection("messagePST10").orderBy("timestamp").snapshots();
                case "computer10":
                  return stream = FirebaseFirestore.instance.collection("messageComputer10").orderBy("timestamp").snapshots();
                case "english10":
                  return stream = FirebaseFirestore.instance.collection("messageEnglish10").orderBy("timestamp").snapshots();
                case "math10":
                  return stream = FirebaseFirestore.instance.collection("messageMath10").orderBy("timestamp").snapshots();
                case "physics11":
                  return stream = FirebaseFirestore.instance.collection("messagePhysics11").orderBy("timestamp").snapshots();
                case "chemistry11":
                  return stream = FirebaseFirestore.instance.collection("messageChemistry11").orderBy("timestamp").snapshots();
                case "islamiyat11":
                  return stream = FirebaseFirestore.instance.collection("messageIslamiyat11").orderBy("timestamp").snapshots();
                case "urdu11":
                  return stream = FirebaseFirestore.instance.collection("messageUrdu11").orderBy("timestamp").snapshots();
                case "computer11":
                  return stream = FirebaseFirestore.instance.collection("messageComputer11").orderBy("timestamp").snapshots();
                case "english11":
                  return stream = FirebaseFirestore.instance.collection("messageEnglish11").orderBy("timestamp").snapshots();
                case "math11":
                  return stream = FirebaseFirestore.instance.collection("messageMath11").orderBy("timestamp").snapshots();
                case "physics12":
                  return stream = FirebaseFirestore.instance.collection("messagePhysics12").orderBy("timestamp").snapshots();
                case "urdu12":
                  return stream = FirebaseFirestore.instance.collection("messageUrdu12").orderBy("timestamp").snapshots();

                default:
                  print("no groups found");
              }
              return stream;
            }
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff6a05ee),
                            Color(0xff7831d2),
                            Color(0xff7445b2),
                          ]
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Class Room",style: GoogleFonts.poppins(fontWeight: FontWeight.w900, fontSize: 18,color: Colors.white),),
                        Row(
                          children: [
                            IconButton(onPressed: (){
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VideoCallScreen()));
                            }, icon: Icon(Icons.video_call_sharp,color: Colors.white,)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: messages(),
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
                        reverse: true, // Display the newest messages at the bottom
                        children: messageDocs.reversed.map((doc) {
                          final data = doc.data() as Map<String,dynamic>;
                          final text = data["text"] as String;
                          final sender = data["sender"] as String;
                          final timeStamp = data["timestamp"].toString();
                          final isSentMessage = sender == userName.toString(); // Check if the message was sent by the current user

                          return Align(
                            alignment: isSentMessage ? Alignment.bottomRight : Alignment.bottomLeft,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        offset: Offset(2,6),
                                        blurRadius: 9,
                                        spreadRadius: 3
                                    )
                                  ],
                                  gradient: isSentMessage ? LinearGradient(colors: [
                                    Color(0xFF5001B2),
                                    Color(0xFF8401D0),
                                  ]
                                  ):LinearGradient(colors: [
                                    Color(0xFFA932EE),
                                    Color(0xFFC06FFB),
                                  ]),
                                  borderRadius: isSentMessage?BorderRadius.only(topLeft: Radius.zero,bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20)):BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.zero)
                              ),
                              child: Column(
                                crossAxisAlignment : CrossAxisAlignment.start,
                                children: [
                                  Text(sender,style: TextStyle(color: Colors.white,fontSize: 10),),
                                  Text(
                                    text,
                                    style: english.hasMatch(text)==false?TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 18,fontFamily: "jameel"):GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 15,),
                                    textAlign: english.hasMatch(text)? TextAlign.left:TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10,),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color:brightness == Brightness.dark?Color(0xffa029ff):Colors.deepPurple,
                                    width: 2
                                )
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      style: english.hasMatch(msgController.text.toString()) == false?TextStyle(
                                        fontFamily: "jameel"
                                      ):GoogleFonts.roboto(),
                                      cursorColor: Colors.deepPurple,
                                      textAlignVertical: TextAlignVertical.top,
                                      controller: msgController,
                                      decoration: InputDecoration(
                                          hintText: "Send Message",
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none
                                      ),
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return;
                                        }
                                      },
                                    ),

                                  ),
                                ),
                                IconButton(onPressed: (){}, icon: Icon(Icons.attach_file,color:brightness == Brightness.dark?Color(0xffa029ff):Colors.deepPurple,)),
                                IconButton(onPressed: ()async{
                                  if(_formKey.currentState!.validate()){
                                    await sendMessage(msgController.text.toString(), userName);
                                    msgController.clear();
                                  }
                                }, icon: Icon(Icons.send,color:brightness == Brightness.dark?Color(0xffa029ff):Colors.deepPurple,)),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: (){}, icon: Icon(Icons.mic,color:brightness == Brightness.dark?Color(0xffa029ff):Colors.deepPurple,))
                      ],
                    ),
                  ),
                )
              ],
            );
          }else{
            return Column();
          }
        },
      );
    }else{
      return Column();
    }

  },
);
  }
}
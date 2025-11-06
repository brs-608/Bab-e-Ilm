import 'package:bab_e_ilm/Bloc/HomePages/user_info_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportScreen extends StatefulWidget {
  String supportType;
  SupportScreen({required this.supportType});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;
    final RegExp english = RegExp(r'^[a-zA-Z]+');
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30)),
                gradient: LinearGradient(colors: [
                  Color(0xffa029ff),
                  Color(0xff8304e5),
                  Color(0xff4d008c),
                ])),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17, right: 5),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17),
                  child: Icon(
                    Icons.headset_mic_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "${widget.supportType}",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 20),
                    )),
              ],
            ),
          )),
      body: BlocBuilder<UserInfoBloc, UserInfoState>(
        builder: (context, state) {
          if (state is UserDataState) {
            String fullName = state.data['fullName'];
            List<String> nameSplitter = fullName.split(" ");
            String firstName = nameSplitter[0];
            Future<void> sendMessage(String text, String sender) async {
              await FirebaseFirestore.instance
                  .collection(
                      '${state.data['email']}${widget.supportType == "Customer Support" ? "_customerSupport" : "_techSupport"}')
                  .doc(DateTime.now().toString())
                  .set({
                'message': text,
                'sender': sender,
                'timestamp': FieldValue.serverTimestamp(),
              });
            }

            final userName = state.data['userName'];
            return Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.headset_mic_outlined,
                          color: brightness == Brightness.light?Colors.black:Colors.white.withOpacity(0.9),
                          size: 36,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Hello $firstName, share\nyour problem with us.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w700,
                        color: brightness == Brightness.light?Colors.black:Colors.white.withOpacity(0.9),
                        fontSize: 24),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(
                            "${state.data['email']}${widget.supportType == "Customer Support" ? "_customerSupport" : "_techSupport"}")
                        .orderBy("timestamp")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
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
                            child: Text(
                          'No Chats yet!',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w900, fontSize: 16),
                        ));
                      }

                      final messageDocs = snapshot.data!.docs;

                      return ListView(
                        reverse: true, // Display the newest messages at the bottom
                        children: messageDocs.reversed.map((doc) {
                          final data = doc.data() as Map<String, dynamic>;
                          final text = data["message"] as String;
                          final sender = data["sender"] as String;
                          final timeStamp = data["timestamp"].toString();
                          final isSentMessage = sender == userName.toString(); // Check if the message was sent by the current user

                          return Align(
                            alignment: isSentMessage
                                ? Alignment.bottomRight
                                : Alignment.bottomLeft,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        offset: Offset(2, 6),
                                        blurRadius: 9,
                                        spreadRadius: 3)
                                  ],
                                  gradient: isSentMessage
                                      ? LinearGradient(colors: [
                                          Color(0xFF5001B2),
                                          Color(0xFF8401D0),
                                        ])
                                      : LinearGradient(colors: [
                                          Color(0xFFA932EE),
                                          Color(0xFFC06FFB),
                                        ]),
                                  borderRadius: isSentMessage
                                      ? BorderRadius.only(
                                          topLeft: Radius.zero,
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20))
                                      : BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.zero)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  sender == "babeilm"
                                      ? RichText(
                                          text: TextSpan(children: [
                                          TextSpan(text: sender),
                                          WidgetSpan(
                                              child: SizedBox(
                                            width: 5,
                                          )),
                                          WidgetSpan(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 1),
                                            child: Icon(
                                              Icons.verified,
                                              size: 14,
                                              color: Colors.yellow,
                                            ),
                                          ))
                                        ]))
                                      : Text(
                                          sender,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                  Text(
                                    text,
                                    style: english.hasMatch(text) == false
                                        ? TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18,
                                            fontFamily: "jameel")
                                        : GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15,
                                          ),
                                    textAlign: english.hasMatch(text)
                                        ? TextAlign.left
                                        : TextAlign.right,
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.deepPurple, width: 2)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Form(
                                    child: TextFormField(
                                      style: english.hasMatch(messageController
                                                  .text
                                                  .toString()) ==
                                              false
                                          ? TextStyle(fontFamily: "jameel")
                                          : GoogleFonts.roboto(),
                                      cursorColor: Colors.deepPurple,
                                      textAlignVertical: TextAlignVertical.top,
                                      controller: messageController,
                                      decoration: InputDecoration(
                                          hintText: "Send Message",
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.attach_file,
                                      color: Colors.deepPurple,
                                    )),
                                IconButton(
                                    onPressed: () async {
                                      await sendMessage(
                                          messageController.text.toString(),
                                          userName);
                                      messageController.clear();
                                    },
                                    icon: Icon(
                                      Icons.send,
                                      color: Colors.deepPurple,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.mic,
                              color: Colors.deepPurple,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
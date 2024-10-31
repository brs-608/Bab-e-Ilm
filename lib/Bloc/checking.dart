
import 'package:bab_e_ilm/views/widget/comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';


class Checking extends StatefulWidget {
  const Checking({super.key});

  @override
  State<Checking> createState() => _CheckingState();
}

class _CheckingState extends State<Checking> {
  // Future<QuerySnapshot<Map<String,dynamic>>> getCommentInfo()async{
  @override
  Widget build(BuildContext context) {
    // print("build");
    final instance = FirebaseFirestore.instance;
    var ref = instance.collection("lecturePhysics9").doc("Introduction To Physics").collection("comment");
    // print(ref);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),

        onPressed: (){
          setState(() {

          });
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("lecturePhysics9").doc("Introduction To Physics").collection("comments").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
            return const Center(
              child: Text("No Questions available",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
            );
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: Container(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  color: Colors.deepPurpleAccent,
                ),
              ),
            );
          }else if(snapshot.hasError){
            return const Center(
              child: Text("Something went wrong!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
            );
          }else{
            final comments = snapshot.data!.docs;
            final commentWidget = comments.map((doc)  {
              final sender = doc["sender"];
              final comment = doc['question'];
              return CommentWidget("", sender, comment);
            }).toList();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children : commentWidget
                ),
              ),
            );
          }}
      )
    );
  }
}

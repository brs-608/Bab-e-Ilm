
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateGroup extends StatefulWidget {
  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController subjectIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xffa414ff),
                          Color(0xff7604ef),
                          Color(0xff5001b2),
                        ]
                    )
                ),
              ),
              Padding(padding:EdgeInsets.symmetric(horizontal: 10,vertical: 26),child: IconButton(icon:Icon(Icons.arrow_back,color: Colors.white,size: 30,),onPressed: (){Navigator.of(context).pop();},)),
              Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Center(child: Text("Create Group",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w900),)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 100,bottom: 30),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 10
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Text("Create a new Group",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepPurple),),
                      SizedBox(height: 30,),
                      Stack(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextFormField(

                                    style: TextStyle(color: Colors.deepPurple),
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: "Enter the group name",
                                      label: Text("Group Name",style: TextStyle(color: Colors.deepPurple),),
                                      prefixIcon: Icon(FontAwesomeIcons.userGroup,color: Colors.deepPurple,),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.deepPurple
                                          )
                                      ),
                                      border:  OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black
                                          )
                                      ),
                                      fillColor: Colors.grey.withOpacity(0.1),
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return "Enter the Group Name";
                                      }else{
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextFormField(

                                    style: TextStyle(color: Colors.deepPurple),
                                    controller: subjectIDController,
                                    decoration: InputDecoration(
                                      hintText: "Enter the subject ID",
                                      label: Text("Subject ID",style: TextStyle(color: Colors.deepPurple),),
                                      prefixIcon: Icon(FontAwesomeIcons.idCardClip,color: Colors.deepPurple,),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.deepPurple
                                          )
                                      ),
                                      border:  OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black
                                          )
                                      ),
                                      fillColor: Colors.grey.withOpacity(0.1),
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return "Enter the subject id";
                                      }else{
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: 20,),
                              ],
                            ),
                          ),
                          Padding(padding:EdgeInsets.only(top: 60),child: Center(child: loading == true?CircularProgressIndicator(color: Colors.deepPurple,):null)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.deepPurple
                              )
                          ),
                          onPressed: ()async{
                              if(_formKey.currentState!.validate()){
                                setState(() {
                                  loading = true;
                                });
                                final groupsCollection = FirebaseFirestore.instance.collection("groups");
                                try {
                                  await groupsCollection.add({
                                    "groupName": nameController.text.toString(),
                                    "subjectID": subjectIDController.text.toString(),
                                  }).then((value)  {
                                    print("Group created successfully");
                                    Navigator.pop(context);
                                  });

                                } catch (error) {
                                  loading = false;
                                  print("Error creating group: $error");
                                }
                              }
                          }, child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Create Group",style: TextStyle(fontSize: 16),))
                      ),
                      SizedBox(height: 20,),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Lectures extends StatelessWidget {
  const Lectures({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.deepPurple,
                          width: 2
                      )
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.school,color: Colors.deepPurple,),
                      SizedBox(width: 10,),
                      Text("English Class",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
                    ],
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.deepPurple,
                          width: 2
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("اردو   کلاس",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.deepPurple,fontFamily: "jameel",letterSpacing: 2),),
                      SizedBox(width: 10,),
                      Icon(Icons.school,color: Colors.deepPurple,),
                      SizedBox(width: 10,),

                    ],
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.deepPurple,
                          width: 2
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("اسلامیات   کلاس",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.deepPurple,fontFamily: "jameel",letterSpacing: 2),),
                      SizedBox(width: 10,),
                      Icon(Icons.school,color: Colors.deepPurple,),
                      SizedBox(width: 10,),

                    ],
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.deepPurple,
                          width: 2
                      )
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.school,color: Colors.deepPurple,),
                      SizedBox(width: 10,),
                      Text("Math Class",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
                    ],
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.deepPurple,
                          width: 2
                      )
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.school,color: Colors.deepPurple,),
                      SizedBox(width: 10,),
                      Text("Physics Class",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
                    ],
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.deepPurple,
                          width: 2
                      )
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.school,color: Colors.deepPurple,),
                      SizedBox(width: 10,),
                      Text("Chemistry Class",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
                    ],
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.deepPurple,
                          width: 2
                      )
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.school,color: Colors.deepPurple,),
                      SizedBox(width: 10,),
                      Text("Computer Class",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
                    ],
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.deepPurple,
                          width: 2
                      )
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.school,color: Colors.deepPurple,),
                      SizedBox(width: 10,),
                      Text("Biology Class",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: Colors.deepPurple),)
                    ],
                  ),
                )
            ),
            SizedBox(height: 20,),
          ],
        )
    );
  }
}

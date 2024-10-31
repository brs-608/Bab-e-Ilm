import 'package:bab_e_ilm/views/widget/feedback_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;
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
                  padding: const EdgeInsets.only(top: 17,right: 5),
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ), Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Icon(
                    Icons.chat_bubble_outline,
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
                      "Customer Feedback",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 20),
                    )),
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Padding(
              padding: const EdgeInsets.only(top:50),
              child: Center(child: Text("Overall Rating",style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.black:Colors.white.withOpacity(0.9),fontWeight: FontWeight.w600,fontSize: 22),)),
            ),
            Text("4.6",style: GoogleFonts.montserrat(color: brightness == Brightness.light?Colors.black:Colors.white.withOpacity(0.9),fontSize: 80,fontWeight: FontWeight.w700),),
            RatingBarIndicator(

              itemBuilder: (context,index){
                return Icon(Icons.star,color: Colors.amber,);
              },
              rating: 4.6,
              unratedColor: Colors.amber.withOpacity(0.3),
              itemSize: 40,
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 30,),
                Text("Excellent",style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.black:Colors.white.withOpacity(0.9),fontWeight: FontWeight.w600,fontSize : 18),),
                SizedBox(width: 5,),
                _buildProgressBar("label", Colors.pinkAccent, 40,20,context),
                SizedBox(width: 15,),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 30,),
                Text("Good",style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.black:Colors.white.withOpacity(0.9),fontWeight: FontWeight.w600,fontSize : 18),),
                SizedBox(width: 5,),
                _buildProgressBar("label", Colors.pinkAccent, 75,52.2,context),
                SizedBox(width: 15,),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 30,),
                Text("Average",style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.black:Colors.white.withOpacity(0.9),fontWeight: FontWeight.w600,fontSize : 18),),
                SizedBox(width: 5,),
                _buildProgressBar("label", Colors.pinkAccent, 25,23,context),
                SizedBox(width: 15,),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 30,),
                Text("Poor",style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.black:Colors.white.withOpacity(0.9),fontWeight: FontWeight.w600,fontSize : 18),),
                SizedBox(width: 5,),
                _buildProgressBar("label", Colors.pinkAccent, 60,62,context),
                SizedBox(width: 15,),
              ],
            ),
            SizedBox(height: 25,),
            FeedbackComment(name: "Burhan Shaikh", duration: "2 days ago", rating: 4.4, feedback: "This app is so amazing, I am loving this, this app provided me best education."),
            SizedBox(height: 20,),
            FeedbackComment(name: "Burhan Shaikh", duration: "2 days ago", rating: 3.1, feedback: "This app is good but there are some things that be changed."),
            SizedBox(height: 100,)
        
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            )
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.deepPurple
          )
        ),
        onPressed: (){},
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text("Give your feedback",style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

Widget _buildProgressBar(String label, Color color, int percentage,double padding,BuildContext context) {
  ThemeData theme = Theme.of(context);
  Brightness brightness = theme.brightness;
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(left: padding,right: 20),
      child: Container(
        // width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.black.withOpacity(0.3))
        ),
        child: LinearProgressIndicator(
          backgroundColor: brightness == Brightness.light?Colors.grey.withOpacity(0.1):Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(0),
          minHeight: 10,
          valueColor: AlwaysStoppedAnimation<Color>(color),
          value: percentage/100,
        ),
      ),
    ),
  );
}
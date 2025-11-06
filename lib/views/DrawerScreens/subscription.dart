import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back,color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,),),
        title: Text("Subscription",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontWeight: FontWeight.w900)),
        systemOverlayStyle: SystemUiOverlayStyle(
            // statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: brightness == Brightness.dark?Brightness.light:Brightness.dark
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom:25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurpleAccent
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text("Subscribe\nthe best plan of",style: GoogleFonts.poppins(fontWeight: FontWeight.w900,color: Colors.white.withOpacity(0.9),fontSize: 16),),
                            Row(
                              children: [
                                Text("Bab-e-Ilm ",style: GoogleFonts.poppins(fontWeight: FontWeight.w900,color: Colors.white.withOpacity(0.9),fontSize: 19),),
                                SizedBox(width: 5,),
                                Text("for",style: GoogleFonts.poppins(fontWeight: FontWeight.w900,color: Colors.white.withOpacity(0.9),fontSize: 16),),

                              ],

                            ),
                            Text("best learning.",style: GoogleFonts.poppins(fontWeight: FontWeight.w900,color: Colors.white.withOpacity(0.9),fontSize: 16),),

                          ],
                        ),
                      ),
                      Image.asset("assets/12.png")
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 30,bottom: 20),
                  child: Text("Packages",style: GoogleFonts.poppins(fontWeight: FontWeight.w900,fontSize: 26,color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black),)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 450,
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: brightness == Brightness.dark?Colors.grey.withOpacity(0.3):Colors.deepPurple.withOpacity(0.1)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Icon(FontAwesomeIcons.paperPlane,color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.deepPurple,size: 48,),
                            SizedBox(height: 10,),
                            Text("STARTER",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w900),),
                            SizedBox(height: 15,),
                            Row(

                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 30,right: 5,left: 55),
                                  alignment: Alignment.centerRight,
                                    child: Text("PKR",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontSize: 14,fontWeight: FontWeight.w500),)),
                                Text("699",style: GoogleFonts.oswald(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontSize: 60,fontWeight: FontWeight.w900),),
                                Container(
                                  padding: EdgeInsets.only(top: 30,left: 5),
                                    child: Text("for 3 month",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontSize: 14,fontWeight: FontWeight.w500),)),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30,right: 30),
                              child: Divider(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):null,),
                            ),
                            SizedBox(height: 20,),
                            Column(
                              children: [
                                Text("Get notes of all subjects",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                                SizedBox(height: 10,),
                                Text("Add free experience",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontSize: 14,fontWeight: FontWeight.w500),)

                              ],
                            ),
                            SizedBox(height: 20,),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.deepPurple
                                ),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                )
                              ),
                                onPressed: (){}, child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
                                  child: Text("Get Started",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.black.withOpacity(0.6):Colors.white,fontWeight: FontWeight.w800),),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                       Container(
                        height: 450,
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: brightness == Brightness.dark?Colors.grey.withOpacity(0.3):Colors.deepPurple.withOpacity(0.1)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Icon(FontAwesomeIcons.rocket,color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.deepPurple,size: 48,),
                            SizedBox(height: 10,),
                            Text("PREMIUM",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w900),),
                            SizedBox(height: 15,),
                            Row(

                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 30,right: 5,left: 45),
                                  alignment: Alignment.centerRight,
                                    child: Text("PKR",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontSize: 14,fontWeight: FontWeight.w500),)),
                                Text("1999",style: GoogleFonts.oswald(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontSize: 60,fontWeight: FontWeight.w900),),
                                Container(
                                  padding: EdgeInsets.only(top: 30,left: 5),
                                    child: Text("for 3 month",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontSize: 14,fontWeight: FontWeight.w500),)),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30,right: 30),
                              child: Divider(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):null,),
                            ),
                            SizedBox(height: 20,),
                            Column(
                              children: [
                                Text("All the facilites of starter package",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                                SizedBox(height: 10,),
                                Text("Iteractive live classes",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                                SizedBox(height: 10,),
                                Text("Preparation test will be taken",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),


                              ],
                            ),
                            SizedBox(height: 20,),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.deepPurple
                                ),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                )
                              ),
                                onPressed: (){}, child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
                                  child: Text("Get Started",style: GoogleFonts.poppins(color: brightness == Brightness.dark?Colors.black.withOpacity(0.6):Colors.white,fontWeight: FontWeight.w800),),
                                ))
                          ],
                        ),
                      ),
                  
                      // SizedBox(width : 10),

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

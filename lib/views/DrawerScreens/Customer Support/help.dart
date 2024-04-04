import 'package:bab_e_ilm/views/DrawerScreens/Customer%20Support/customer_support.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
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
                        "Customer Help",
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
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      shape: BoxShape.circle
                    ),
                      child: Icon(Icons.headset_mic_outlined,color: Colors.black,size: 36,)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Hello, How can we\n help you?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.arrowPointer,color: Colors.black.withOpacity(0.7),size: 20,),
                            SizedBox(width: 10,),
                            Text("Technical Support",style: GoogleFonts.openSans(fontSize: 17,fontWeight: FontWeight.w900,color: Colors.black.withOpacity(0.7)),),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                    child: IconButton(icon:Icon(Icons.arrow_forward_ios,size: 20,color: Colors.black.withOpacity(0.7),),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SupportScreen(supportType: "Technical Support",)));},)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0 , right: 20,top: 0),
                        child: Divider(),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 20,right: 20,top: 2),
                        child: Text(
                          "Select if you are facing a problem with purchasing,\nattending online classes or any technical bug.",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7)
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
                        child: Row(
                          children: [
                            Icon(Icons.shopping_cart_rounded,color: Colors.black.withOpacity(0.7),size: 20,),
                            SizedBox(width: 10,),
                            Text("Customer Support",style: GoogleFonts.openSans(fontSize: 17,fontWeight: FontWeight.w900,color: Colors.black.withOpacity(0.7)),),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                    child: IconButton(icon:Icon(Icons.arrow_forward_ios,size: 20,color: Colors.black.withOpacity(0.7),),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SupportScreen(supportType: "Customer Support")));},)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0 , right: 20,top: 0),
                        child: Divider(),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 20,right: 20,top: 2),
                        child: Text(
                          "Select if you need help in choosing a product or to know more about a product.",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7)
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}

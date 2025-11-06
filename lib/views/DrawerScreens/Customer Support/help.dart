import 'package:bab_e_ilm/views/DrawerScreens/Customer%20Support/customer_support.dart';
import 'package:bab_e_ilm/views/widget/customer_support_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Help extends StatelessWidget {
  const Help({super.key});

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
                      child: Icon(Icons.headset_mic_outlined,color: brightness == Brightness.light?Colors.black:Colors.white.withOpacity(0.9),size: 36,)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Hello, How can we\n help you?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w700,
                      color: brightness == Brightness.light?Colors.black:Colors.white.withOpacity(0.9),
                      fontSize: 24),
                ),
              ),
              CustomerSupportWidget(supportType: "Technical Support", supportDescription: "Select if you are facing a problem with purchasing, attending online classes or any technical bug.", icon: FontAwesomeIcons.arrowPointer,),
              CustomerSupportWidget(supportType: "Customer Support", supportDescription: "Select if you need help in choosing a product or to know more about a product.", icon: Icons.shopping_cart_rounded,),
              const SizedBox(height: 20,)
            ],
          )
      ),
    );
  }
}

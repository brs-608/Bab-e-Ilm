import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../DrawerScreens/Customer Support/customer_support.dart';


class CustomerSupportWidget extends StatelessWidget {
  String supportType;
  String supportDescription;
  IconData icon;
  CustomerSupportWidget({required this.supportType,required this.supportDescription,required this.icon});


  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: brightness == Brightness.light?Colors.grey.withOpacity(0.1):Colors.white.withOpacity(0.1)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
              child: Row(
                children: [
                  Icon(icon,color: brightness == Brightness.light?Colors.black.withOpacity(0.7):Colors.white.withOpacity(0.9),size: 20,),
                  SizedBox(width: 10,),
                  Text(supportType,style: GoogleFonts.openSans(fontSize: 17,fontWeight: FontWeight.w900,color: brightness == Brightness.light?Colors.black.withOpacity(0.7):Colors.white.withOpacity(0.9)),),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(icon:Icon(Icons.arrow_forward_ios,size: 20,color: brightness == Brightness.light?Colors.black.withOpacity(0.7):Colors.white.withOpacity(0.9),),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SupportScreen(supportType: supportType,)));},)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0 , right: 20,top: 0),
              child: Divider(color: brightness == Brightness.light?Colors.black.withOpacity(0.7):Colors.white.withOpacity(0.9),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 2),
              child: Text(
                supportDescription,
                style: TextStyle(
                    color: brightness == Brightness.light?Colors.black.withOpacity(0.7):Colors.white.withOpacity(0.9)
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

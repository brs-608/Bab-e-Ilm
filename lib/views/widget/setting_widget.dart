import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingWidget extends StatelessWidget {
  IconData mainIcon;
  String settingTitle;
  double iconSize;
  final VoidCallback onTap;
  SettingWidget({required this.iconSize,required this.mainIcon, required this.settingTitle,required this.onTap});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color:brightness == Brightness.dark?Color(0xffa029ff):Colors.deepPurple,width: 2)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Icon(mainIcon,color:brightness == Brightness.dark?Color(0xffeceaf5):Colors.deepPurple,size: iconSize,),
                  SizedBox(width: 10,),
                  Text("${settingTitle}",
                    style: GoogleFonts.poppins(color:brightness == Brightness.dark?Color(0xffeceaf5):
                    Colors.deepPurple,fontWeight: FontWeight.w700,fontSize: 14),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(onPressed: onTap,icon: Icon(Icons.arrow_forward_ios,color:brightness == Brightness.dark?Color(0xffeceaf5):Colors.deepPurple,size: 24,)),
            )
          ],
        ),
      ),
    );

  }
}

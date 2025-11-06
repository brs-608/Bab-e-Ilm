import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationWidget extends StatelessWidget {
  String notificationType;
  String notificationMessage;
  NotificationWidget({required this.notificationType,required this.notificationMessage});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;
    final RegExp english = RegExp(r'^[a-zA-Z]+');
    return notificationType == "notesNotification"?
    Container(
      // height: 160,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Card(
        
        elevation: 11,
        color: brightness == Brightness.light?Colors.white.withOpacity(0.8):Colors.white.withOpacity(0.1),
        // color: Colors.white54
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 18,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Icon(Icons.notifications,color: brightness == Brightness.light?Colors.deepPurple:Color(0xffa029ff),size: 24,),
                    Text("Notes Alert",style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.deepPurple:Color(0xffa029ff),fontSize: 16,fontWeight: FontWeight.w800),),
                  ],
                ),
                Text("2 min ago",style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.black.withOpacity(0.6):Colors.white.withOpacity(0.8),fontWeight: FontWeight.w500,fontSize: 14),)
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19,right: 7.0,top: 5),
              child: Text(notificationMessage,style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.black.withOpacity(0.8):Colors.white.withOpacity(0.9),fontSize: 14,),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                TextButton(onPressed: (){}, child: Text("Okay",style: TextStyle(color: brightness == Brightness.light?Colors.deepPurple:Colors.white.withOpacity(0.8),fontSize: 14),),),
                TextButton(onPressed: (){}, child: Text("Let's See",style: TextStyle(color: brightness == Brightness.light?Colors.deepPurple:Colors.white.withOpacity(0.8),fontSize: 14)),)
              ],),
            )
          ],
          )
      )
    )
    :notificationType == "videoCallNotification"?
    Container(
      // height: 160,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Card(
        
        elevation: 11,
        color: brightness == Brightness.light?Colors.white.withOpacity(0.8):Colors.white.withOpacity(0.1),
        // color: Colors.white54
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 18,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Icon(Icons.notifications,color: brightness == Brightness.light?Colors.deepPurple:Color(0xffa029ff),size: 24,),
                    Text("Online Class Alert",style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.deepPurple:Color(0xffa029ff),fontSize: 16,fontWeight: FontWeight.w800),),
                  ],
                ),
                Text("2 min ago",style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.black.withOpacity(0.6):Colors.white.withOpacity(0.8),fontWeight: FontWeight.w500,fontSize: 14),)
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19,right: 39,top: 5),
              child: Text(notificationMessage,style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.black.withOpacity(0.8):Colors.white.withOpacity(0.9),fontSize: 14,),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                TextButton(onPressed: (){}, child: Text("Okay",style: TextStyle(color: brightness == Brightness.light?Colors.deepPurple:Colors.white.withOpacity(0.8),fontSize: 14),),),
                TextButton(onPressed: (){}, child: Text("Join",style: TextStyle(color: brightness == Brightness.light?Colors.deepPurple:Colors.white.withOpacity(0.8),fontSize: 14)),)
              ],),
            )
          ],
          )
      )
    ):
    Container(
      // height: 160,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Card(
        
        elevation: 11,
        color: brightness == Brightness.light?Colors.white.withOpacity(0.8):Colors.white.withOpacity(0.1),
        // color: Colors.white54
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 18,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.notifications,color: brightness == Brightness.light?Colors.deepPurple:Color(0xffa029ff),size: 24,),
                    Text("Subscription Expiry \nAlert",style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.deepPurple:Color(0xffa029ff),fontSize: 16,fontWeight: FontWeight.w800,),maxLines: 2,),
                  ],
                ),
                Text("2 min ago",style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.black.withOpacity(0.6):Colors.white.withOpacity(0.8),fontWeight: FontWeight.w500,fontSize: 14),)
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19,right: 39,top: 5),
              child: Text(notificationMessage,style: GoogleFonts.poppins(color: brightness == Brightness.light?Colors.black.withOpacity(0.8):Colors.white.withOpacity(0.9),fontSize: 14,),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                TextButton(onPressed: (){}, child: Text("Okay",style: TextStyle(color: brightness == Brightness.light?Colors.deepPurple:Colors.white.withOpacity(0.8),fontSize: 14),),),
                TextButton(onPressed: (){}, child: Text("Renew",style: TextStyle(color: brightness == Brightness.light?Colors.deepPurple:Colors.white.withOpacity(0.8),fontSize: 14)),)
              ],),
            )
          ],
          )
      )
    );
  }
}

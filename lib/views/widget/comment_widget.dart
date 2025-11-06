import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  String email;
  String profilePic;
  String comment;
  CommentWidget(this.profilePic,this.email,this.comment);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;
    return InkWell(
      onTap: (){

      },

      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 15,top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(width: 10,),
            CircularProfileAvatar(
              profilePic,
              radius: 18,
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(email,style: TextStyle(color: brightness == Brightness.dark?Colors.grey.shade500:Colors.grey.shade700),),
                  Text(comment,maxLines: 3,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

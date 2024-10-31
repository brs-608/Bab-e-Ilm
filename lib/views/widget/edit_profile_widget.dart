import 'package:flutter/material.dart';


class EditProfileWidget extends StatelessWidget {
  String fieldName;
  String fieldValue;
  EditProfileWidget({required this.fieldName,required this.fieldValue});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 30,bottom: 10),
          child: Text("$fieldName *",style: TextStyle(fontWeight: FontWeight.w900,color:brightness == Brightness.dark?Colors.white.withOpacity(0.6):Colors.deepPurple,fontSize: 14),),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(fieldValue,style: TextStyle(color:brightness == Brightness.dark?Colors.white.withOpacity(0.8)
                  :Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Icon(Icons.edit,color:brightness == Brightness.dark?Colors.white.withOpacity(0.8):Colors.deepPurple,)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackComment extends StatelessWidget {
  String name;
  String duration;
  double rating;
  String feedback;
  FeedbackComment({required this.name,required this.duration,required this.rating,required this.feedback});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Brightness brightness = theme.brightness;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 25,),
            Container(
              height: 55,
              width:  60,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10,right: 30,bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${name}",style: TextStyle(color: brightness == Brightness.light?Colors.black:Colors.white.withOpacity(0.9)),),
                        Text("${duration}",style: TextStyle(color: brightness == Brightness.light?Colors.black:Colors.white.withOpacity(0.9)),)
                      ],
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context,index){
                            return Icon(Icons.star,color: Colors.amber,);
                          },
                          rating: rating,
                          unratedColor: Colors.amber.withOpacity(0.3),
                          itemSize: 20,
                        ),
                        SizedBox(width: 5,),
                        Text("(${rating})",style: TextStyle(color: brightness == Brightness.light?Colors.black.withOpacity(0.5):Colors.white.withOpacity(0.8)),)
                      ],
                    )
                  ],
                ),
              ),
            )

          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30,right: 10,top: 10),
          child: Text("${feedback}"),
        )
      ],
    );
  }
}

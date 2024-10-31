// import 'package:flutter/material.dart';
//
// class MessageBox extends StatelessWidget {
//   String text;
//   String sender;
//   String? timstramp;
//   MessageBox({required this.text,required this.sender, this.timstramp});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(padding:EdgeInsets.only(left: 10),child: Text(sender)),
//           Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.deepPurple,
//               borderRadius: BorderRadius.circular(30),
//
//             ),
//             child: Text(text,style: TextStyle(color: Colors.white),maxLines: 15,),
//           ),
//           Container(padding: EdgeInsets.only(left: 10),child: Text("",style: TextStyle(color: Colors.deepPurple),))
//         ],
//       ),
//     );
//   }
// }

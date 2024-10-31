// import 'package:flutter/foundation.dart';
//
// class SelectedSubjectProvider with ChangeNotifier{
//   String _subjectName = "";
//   String _subjectID = '';
//   String get subjectName => _subjectName;
//   String get subjectID => _subjectID;
//   void selectedSubject(String subName,String? subID){
//     _subjectName = subName;
//     if(subID != null){
//       _subjectID = subID;
//     }else{
//       _subjectID = "";
//     }
//     notifyListeners();
//   }
// }
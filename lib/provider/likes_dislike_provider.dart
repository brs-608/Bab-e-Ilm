import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LikeDislike with ChangeNotifier{

  int _likes = 0;
  int _dislikes = 0;
  bool _isLiked = false;
  bool _isDisliked = false;
  bool get isLiked => _isLiked;
  bool get isDisliked => _isDisliked;
  int get likes => _likes;
  int get dislikes => _dislikes;
  void isLike(){
      _isLiked = true;
      _isDisliked = false;
  }
  void isDislike(){
      _isDisliked = true;
      _isLiked = false;
  }
  void likeDefault(){
    _isLiked = false;
    _isDisliked= false;
  }
  void setLikes(int noLikes){
      _likes = noLikes;
      notifyListeners();
  }

  void setDislikes(int noDislikes){
      _dislikes = noDislikes;
      notifyListeners();
  }

  void likeVideo(String lectureId, String userId,String group) async{
    FirebaseFirestore.instance.collection(group).doc(lectureId).update({
      'likes': FieldValue.arrayUnion([userId]),
      'dislikes': FieldValue.arrayRemove([userId]),
    });
    DocumentSnapshot ref = await FirebaseFirestore.instance.collection(group).doc(lectureId).get();
    var listRef = ref.data() as Map<String,dynamic>;
    var likeList = listRef["likes"] as List;
    _likes = likeList.length;
    var dislikeList = listRef["dislikes"] as List;
    _dislikes = dislikeList.length;
    notifyListeners();
  }

  void dislikeVideo(String lectureId, String userId,String group) async{
    FirebaseFirestore.instance.collection(group).doc(lectureId).update({
      'likes': FieldValue.arrayRemove([userId]),
      'dislikes': FieldValue.arrayUnion([userId]),
    });
    DocumentSnapshot ref = await FirebaseFirestore.instance.collection(group).doc(lectureId).get();
    var listRef = ref.data() as Map<String,dynamic>;
    var dislikeList = listRef["dislikes"] as List;
    _dislikes = dislikeList.length;
    var likeList = listRef["likes"] as List;
    _likes = likeList.length;
    notifyListeners();
  }

}
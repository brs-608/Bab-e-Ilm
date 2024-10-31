import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'like_dislike_event.dart';
part 'like_dislike_state.dart';

class LikeDislikeBloc extends Bloc<LikeDislikeEvent, LikeDislikeState> {
  LikeDislikeBloc() : super(LikeDislikeInitial()) {
    on<LikeDislikeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LikDisEvent>((event,state){
      emit(LikDisState(event.videoData, event.isLiked, event.isDisliked));
    });
    on<LikeEvent>((event,state)async{
      FirebaseFirestore.instance.collection(event.groupName).doc(event.lectureName).update({
      'likes': FieldValue.arrayUnion([event.userEmail]),
      'dislikes': FieldValue.arrayRemove([event.userEmail]),
    });
          DocumentSnapshot ref = await FirebaseFirestore.instance.collection(event.groupName).doc(event.lectureName).get();
    var listRef = ref.data() as Map<String,dynamic>;
    var likeList = listRef["likes"] as List;
    final likeLength = likeList.length;
    var dislikeList = listRef["dislikes"] as List;
    final dislikeLength = dislikeList.length;
    emit(LikDisState({"videoTitle":event.videoTitle,"likeCount":likeLength,"dislikeCount":dislikeLength}, true, false));
    });
    on<DislikeEvent>((event,state)async{
      FirebaseFirestore.instance.collection(event.groupName).doc(event.lectureName).update({
        'likes': FieldValue.arrayRemove([event.userEmail]),
        'dislikes': FieldValue.arrayUnion([event.userEmail]),
      });
          DocumentSnapshot ref = await FirebaseFirestore.instance.collection(event.groupName).doc(event.lectureName).get();
    var listRef = ref.data() as Map<String,dynamic>;
    var likeList = listRef["likes"] as List;
    final likeLength = likeList.length;
    var dislikeList = listRef["dislikes"] as List;
    final dislikeLength = dislikeList.length;
    emit(LikDisState({"videoTitle":event.videoTitle,"likeCount":likeLength,"dislikeCount":dislikeLength}, false, true));
    });
  }
}

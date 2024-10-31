import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'getting_pic_event.dart';
part 'getting_pic_state.dart';

class GettingPicBloc extends Bloc<GettingPicEvent, GettingPicState> {
  GettingPicBloc() : super(GettingPicInitial()) {
    on<GettingPicEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<StorePic>((event,emit)async{
      Map<String,String> usersProfilePic = {};
      for(int i = 0; i<event.sendersEmail.length;i++){
        Future<String> retrievingProfilePic() async {
          DocumentSnapshot inst = await FirebaseFirestore.instance.collection("users").doc(event.sendersEmail[i]).get();
          if (inst.exists) {
            var newInst = inst.data() as Map<String, dynamic>;
            final profilePic = newInst["profilePic"];
            return profilePic;
          } else {
            return "";
          }
        }
        final String profilePic = await retrievingProfilePic();
        usersProfilePic[event.sendersEmail[i]] = profilePic;
      }


      emit(GettingProPic(usersProfilePic));
    });
  }
}


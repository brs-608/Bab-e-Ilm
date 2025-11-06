import 'dart:async';

import 'package:bab_e_ilm/views/Auth/firebase_services/storingName.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';
var userInfo = UserInfoFireStore();
class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(UserInfoInitial()) {
    on<StoreInfo>((event, emit) async{
      final data = await userInfo.getUserInfo(event.email) as Map<String,dynamic>;
      data["comment"] = false;
      emit(UserDataState(data));
      print(data);
    });
    on<CommentInfoTrue>((event, emit) async{
      final data = await userInfo.getUserInfo(event.email) as Map<String,dynamic>;
      data["comment"] = true;
      emit(UserDataState(data));
    });
    on<CommentInfoFalse>((event, emit) async{
      final data = await userInfo.getUserInfo(event.email) as Map<String,dynamic>;
      data["comment"] = false;
      emit(UserDataState(data));
    });
  }

}

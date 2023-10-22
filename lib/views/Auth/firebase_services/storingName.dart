
import 'package:bab_e_ilm/views/Auth/screens/register_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class UserInfoFireStore{
  final firestoreInst = FirebaseFirestore.instance;
  void storingUserInfo(String name,String userName, String email,String password){
    firestoreInst.collection("users").doc(email).set(
        {
          "fullName" : name,
          "userName" : userName,
          "email" : email,
          "password" : password,
        }).then((value) {
      print("user information stored successfully");
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
  Future<Map<String, dynamic>?> getUserInfo(String email) async {
    DocumentSnapshot userDoc = await firestoreInst.collection('users').doc(email).get();

    if (userDoc.exists) {
      return userDoc.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  }
    Future<void> storingDOBAndGender(String email, String dateOfBirth, String gender) async {

      // Check if the document exists before updating
      final userDocRef = firestoreInst.collection('users').doc(email);
      final userDoc = await userDocRef.get();

      if (userDoc.exists) {
        await userDocRef.update({
          'dateOfBirth': dateOfBirth,
          'gender': gender,
        }).then((_) {
          print('User information updated successfully');
        }).catchError((error) {
          print('Error updating user information: $error');
        });
      } else {
        print('User document not found for email: $email');
      }
  }
      Future<void> storingBoard(String email, String board,) async {

        // Check if the document exists before updating
        final userDocRef = firestoreInst.collection('users').doc(email);
        final userDoc = await userDocRef.get();

        if (userDoc.exists) {
          await userDocRef.update({
            'board': board,
          }).then((_) {
            print('User board updated successfully');
          }).catchError((error) {
            print('Error updating user information: $error');
          });
        } else {
          print('User document not found for email: $email');
        }
    }
  Future<void> storingGrade(String email, int grade,) async {
    final userDocRef = firestoreInst.collection('users').doc(email);
    final userDoc = await userDocRef.get();

    if (userDoc.exists) {
      await userDocRef.update({
        'grade': grade,
      }).then((_) {
        print('User grade updated successfully');
      }).catchError((error) {
        print('Error updating user information: $error');
      });
    } else {
      print('User document not found for email: $email');
    }
  }
  Future<File?> pickImg() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      return imageFile;
    } else {
      return null;
    }
  }
  Future<bool> isUsernameAvailable(String username) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('userName', isEqualTo: username)
          .get();

      return querySnapshot.docs.isEmpty;
    } catch (e) {
      print("Error checking username availability: $e");
      return false; // Handle the error gracefully
    }
  }
  Future<bool> isEmailAvailable(String email) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      return querySnapshot.docs.isEmpty;
    } catch (e) {
      print("Error checking email availability: $e");
      return false; // Handle the error gracefully
    }
  }

  Future<bool> checkTeacherCode(String code) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('teachers')
          .where('teacherCode', isEqualTo: code)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking teacher code: $e");
      return false; // Handle the error gracefully
    }
  }


  Future<void> storingRole(String email, String role,) async {

    // Check if the document exists before updating
    final userDocRef = firestoreInst.collection('users').doc(email);
    final userDoc = await userDocRef.get();

    if (userDoc.exists) {
      await userDocRef.update({
        'UserRole': role,
      }).then((_) {
        print('User role updated successfully');
      }).catchError((error) {
        print('Error updating user information: $error');
      });
    } else {
      print('User document not found for email: $email');
    }
  }

}



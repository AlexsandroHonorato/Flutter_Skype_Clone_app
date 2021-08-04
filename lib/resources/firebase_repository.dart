import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:skype_clone/models/message.dart';
import 'package:skype_clone/models/user_model.dart';
import 'package:skype_clone/provider/image_upload_provider.dart';
import 'package:skype_clone/resources/firebase_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<User> getCurrentUser() => _firebaseMethods.getCurrentUser();

  Future<User> singIn() => _firebaseMethods.singIn();

  Future<UserModel> getUserDetails() => _firebaseMethods.getUserDetails();

  Future<bool> authenticate(User user) =>
      _firebaseMethods.authenticateUser(user);

  Future<void> addDataToDb(User user) => _firebaseMethods.addDataToDb(user);

  //resonsavel por deslogar a conta google
  Future<void> signOut() => _firebaseMethods.signOut();

  Future<List<UserModel>> fetchAllUsers(User user) =>
      _firebaseMethods.fetchAllUsers(user);

  Future<void> addMessageToDb(
          Message message, UserModel sender, UserModel receiver) =>
      _firebaseMethods.addMessageToDb(message, sender, receiver);

  Future<void> uploadImage(
          {@required File image,
          @required String receiverId,
          @required String senderId,
          @required ImageUploadProvider imageUploadProvider}) async =>
      _firebaseMethods.uploadImage(
          image, receiverId, senderId, imageUploadProvider);
}

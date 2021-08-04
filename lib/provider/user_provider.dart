import 'package:flutter/cupertino.dart';
import 'package:skype_clone/models/user_model.dart';
import 'package:skype_clone/resources/firebase_repository.dart';

class UserProvider with ChangeNotifier {
  UserModel _userModel;
  FirebaseRepository _firebaseRepository = FirebaseRepository();

  UserModel get getUser => _userModel;

  void refreshUser() async {
    UserModel userModel = await _firebaseRepository.getUserDetails();
    _userModel = userModel;
    notifyListeners();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    this.uid,
    this.email,
    this.password,
    this.mobile,
    this.userName,
    this.userType});

      String? uid;
      String? email;
      String? password;
      String? mobile;
      String? userName;
      int? userType;

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
        uid: documentSnapshot.get('uid'),
        userName: documentSnapshot.get('userName'),
        email: documentSnapshot.get('email'),
        mobile: documentSnapshot.get('mobile'),
        userType: documentSnapshot.get('userType')
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "userName": userName,
      "email": email,
      "mobile": mobile,
      "userType": userType
    };
  }
}

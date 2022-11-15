import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  UserEntity({
    this.uid,
    this.userName,
    this.userType,
    this.email,
    this.password,
    this.mobile,
    this.images});

  String? uid;
  int? userType;
  String? userName;
  String? email;
  String? mobile;
  String? password;
  String? images;

  @override
  List<Object?> get props => [uid, userType, userName, email, mobile, password, images];
}
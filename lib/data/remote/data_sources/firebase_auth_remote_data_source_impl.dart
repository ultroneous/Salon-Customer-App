import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:salon_customer_app/data/remote/models/user_model.dart';
import 'package:salon_customer_app/domain/entities/user_entity.dart';
import 'auth_remote_data_source.dart';

class FirebaseAuthRemoteDataSourceImpl extends FirebaseAuthRemoteDataSource {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;


  @override
  Future<void> signIn(UserModel user) async => auth.signInWithEmailAndPassword(
      email: user.email!, password: user.password!);


  Future<String> getCurrentUid() async {
    return auth.currentUser!.uid;
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> createCurrentUser(UserEntity user) {
    // TODO: implement createCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(UserEntity user) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<String> uploadImage(UserEntity user) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }

}

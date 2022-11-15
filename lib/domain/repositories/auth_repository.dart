import 'package:salon_customer_app/data/remote/models/user_model.dart';
import 'package:salon_customer_app/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> signIn(UserModel user);
  Future<void> signUp(UserEntity user);
  Future<String> uploadImage(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<String> getCurrentUid();
  Future<void> createCurrentUser(UserEntity user);
  Future<void> forgotPassword(String email);
}

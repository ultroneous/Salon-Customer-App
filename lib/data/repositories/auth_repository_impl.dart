import 'package:salon_customer_app/data/remote/data_sources/auth_remote_data_source.dart';
import 'package:salon_customer_app/data/remote/models/user_model.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class FirebaseRepositoryImpl extends AuthRepository {
  FirebaseAuthRemoteDataSource remoteDataSource;
  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> signUp(UserEntity user) async => remoteDataSource.signUp(user);

  @override
  Future<void> signIn(UserModel user) async => remoteDataSource.signIn(user);

  @override
  Future<void> forgotPassword(String email) async =>
      remoteDataSource.forgotPassword(email);

  @override
  Future<String> getCurrentUid() async => remoteDataSource.getCurrentUid();

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<void> signOut() async => remoteDataSource.signOut();

  @override
  Future<void> createCurrentUser(UserEntity user) async =>
      remoteDataSource.createCurrentUser(user);
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      remoteDataSource.createCurrentUser(user);

  @override
  Future<String> uploadImage(UserEntity user) async =>
      remoteDataSource.uploadImage(user);
}

import 'package:salon_customer_app/data/remote/models/user_model.dart';
import 'package:salon_customer_app/domain/entities/user_entity.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../../../domain/repositories/auth_repository.dart';

class FirebaseRepositoryImpl extends AuthRepository {
  FirebaseAuthRemoteDataSource remoteDataSource;
  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> signIn(UserModel user) async => remoteDataSource.signIn(user);

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

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
  Future<String> getCurrentUid() {
    // TODO: implement getCurrentUid
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

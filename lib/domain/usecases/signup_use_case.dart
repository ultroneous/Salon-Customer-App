
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignupUseCase {
  AuthRepository authRepository;

  SignupUseCase({required this.authRepository});

  Future<void> call(UserEntity user) async {
    return await authRepository.signUp(user);
  }
}
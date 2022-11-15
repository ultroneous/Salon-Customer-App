
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class CreateCurrentUserUseCase {
  AuthRepository authRepository;

  CreateCurrentUserUseCase({required this.authRepository});

  Future<void> call(UserEntity user) async {
    return await authRepository.createCurrentUser(user);
  }
}
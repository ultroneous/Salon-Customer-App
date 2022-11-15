import '../repositories/auth_repository.dart';

class IsSignInUseCase {
  AuthRepository authRepository;

  IsSignInUseCase({required this.authRepository});

  Future<bool> call() async {
    return authRepository.isSignIn();
  }
}

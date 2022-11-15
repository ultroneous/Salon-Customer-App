import 'package:salon_customer_app/data/remote/models/user_model.dart';

import '../repositories/auth_repository.dart';

class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<void> call(UserModel user) async {
    return await authRepository.signIn(user);
  }
}

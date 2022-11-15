part of 'login_bloc.dart';


abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class InitialLogin extends LoginEvent {
  final UserModel userModel;
  const InitialLogin({required this.userModel});

  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}

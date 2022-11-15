part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}


class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginErrorState extends LoginState {
  final FirebaseException exception;
  const LoginErrorState(this.exception);
  @override
  List<Object?> get props => [exception];
}


part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitial extends SignupState {

  @override
  List<Object> get props => [];
}

class SignUpLoadingState extends SignupState {

  @override
  List<Object?> get props => [];
}

class SignUpSuccessState extends SignupState {

  @override
  List<Object?> get props => [];
}

class SignUpErrorState extends SignupState {
  final FirebaseException exception;
  const SignUpErrorState(this.exception);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

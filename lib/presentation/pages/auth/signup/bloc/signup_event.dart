part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class SignupSuccessEvent extends SignupEvent {
  final UserEntity userEntity;
  const SignupSuccessEvent({required this.userEntity});

  @override
  List<Object?> get props => [userEntity];
}


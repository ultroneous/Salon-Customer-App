import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../../../data/remote/data_sources/firebase_auth_remote_data_source_impl.dart';
import '../../../../../data/repositories/auth_repository_impl.dart';
import '../../../../../domain/entities/user_entity.dart';
import '../../../../../domain/usecases/get_create_current_user_use_case.dart';
import '../../../../../domain/usecases/signup_use_case.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupUseCase signupUseCase = SignupUseCase(
      authRepository: FirebaseRepositoryImpl(
          remoteDataSource: FirebaseAuthRemoteDataSourceImpl()));
  CreateCurrentUserUseCase createCurrentUserUseCase = CreateCurrentUserUseCase(
      authRepository: FirebaseRepositoryImpl(
          remoteDataSource: FirebaseAuthRemoteDataSourceImpl()));
  SignupBloc() : super(SignupInitial()) {
    on<SignupSuccessEvent>((event, emit) async {
      emit(SignUpLoadingState());
      try {
        await signupUseCase(event.userEntity);
        await createCurrentUserUseCase(event.userEntity);
        emit(SignUpSuccessState());
      } on FirebaseAuthException catch (e) {
        emit(SignUpErrorState(e));
      }
    }
    );
  }
}

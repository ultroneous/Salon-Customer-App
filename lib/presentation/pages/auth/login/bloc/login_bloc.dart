import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salon_customer_app/domain/usecases/login_use_case.dart';
import '../../../../../common/exception/app_exception.dart';
import '../../../../../data/remote/data_sources/firebase_auth_remote_data_source_impl.dart';
import '../../../../../data/remote/models/user_model.dart';
import '../../../../../data/remote/repositories/auth_repositories.impl.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase signInUseCase = LoginUseCase(
      authRepository: FirebaseRepositoryImpl(
          remoteDataSource: FirebaseAuthRemoteDataSourceImpl()));

  LoginBloc() : super(LoginInitial()) {
    on<InitialLogin>(
      (event, emit) async {
        if (event.userModel.email!.isEmpty) {
          emit(LoginErrorState(
              AppException(message: "Please enter valid email")));
        } else if (event.userModel.password!.isEmpty) {
          emit(LoginErrorState(
              AppException(message: "Please enter valid password")));
        } else {
          emit(LoginLoadingState());
          try {
            await signInUseCase(event.userModel);
            emit(LoginSuccessState());
          } on FirebaseAuthException catch (e) {
            emit(LoginErrorState(e));
          }
        }
      },
    );
  }
}

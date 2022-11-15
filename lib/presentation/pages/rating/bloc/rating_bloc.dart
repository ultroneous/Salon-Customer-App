import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:salon_customer_app/data/remote/data_sources/rating_remote_data_source_impl.dart';
import 'package:salon_customer_app/data/remote/models/rating_model.dart';

import '../../../../common/exception/app_exception.dart';
import '../../../../data/remote/repositories/rating_repositories_impl.dart';
import '../../../../domain/usecases/rating_usecase.dart';

part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingUseCase ratingUseCase = RatingUseCase(
    ratingRepository: RatingRepositoryImpl(
      firebaseRatingRemoteDataSource: FirebaseRatingRemoteDataSourceImpl(),
    ),
  );

  RatingBloc() : super(RatingInitial()) {
    on<RatingSuccessEvent>(
      (event, emit) async {
        emit(RatingLoadingState());
        try {
          await ratingUseCase(event.ratingModel);
          emit(RatingSuccessState());
        } on AppException catch (e) {
          emit(RatingErrorState(exception: e));
        }
      },
    );
  }
}

part of 'rating_bloc.dart';

abstract class RatingState extends Equatable {
  const RatingState();
}

class RatingInitial extends RatingState {
  @override
  List<Object> get props => [];
}

class RatingLoadingState extends RatingState{
  @override
  List<Object> get props => [];
}

class RatingSuccessState extends RatingState{
  @override
  List<Object> get props => [];
}

class RatingErrorState extends RatingState{
  final FirebaseException exception;
  const RatingErrorState({required this.exception});
  @override
  List<Object> get props => [exception];
}


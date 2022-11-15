part of 'rating_bloc.dart';

abstract class RatingEvent extends Equatable {
  const RatingEvent();
}
class RatingSuccessEvent extends RatingEvent {
  final RatingModel ratingModel;
  const RatingSuccessEvent({required this.ratingModel});

  @override
  List<Object?> get props => [ratingModel];
}
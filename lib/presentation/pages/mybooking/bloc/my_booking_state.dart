part of 'my_booking_bloc.dart';

abstract class MyBookingState extends Equatable {
  const MyBookingState();
}

class MyBookingInitial extends MyBookingState {
  @override
  List<Object> get props => [];
}

class MyBookingLoadingState extends MyBookingState {
  @override
  List<Object?> get props => [];
}

class MyBookingSuccessState extends MyBookingState {
  final List booking;
  const MyBookingSuccessState(this.booking);

  @override
  List<Object?> get props => [booking];
}

class MyBookingErrorState extends MyBookingState {
  final AppException exception;
  const MyBookingErrorState(this.exception);

  @override
  List<Object?> get props => [];
}
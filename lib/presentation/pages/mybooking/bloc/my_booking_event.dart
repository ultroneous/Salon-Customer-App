part of 'my_booking_bloc.dart';

abstract class MyBookingEvent extends Equatable {
  const MyBookingEvent();
}

class BookingEvent extends MyBookingEvent{

  @override
  List<Object?> get props => [];
}

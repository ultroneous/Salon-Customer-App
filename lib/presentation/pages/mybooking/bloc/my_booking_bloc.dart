import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../common/exception/app_exception.dart';
import '../../../../domain/repositories/mybooking_repository.dart';

part 'my_booking_event.dart';
part 'my_booking_state.dart';

class MyBookingBloc extends Bloc<MyBookingEvent, MyBookingState> {
  final MyBookingRepository _myBookingRepository = MyBookingRepository();

  MyBookingBloc() : super(MyBookingInitial()) {
    on<BookingEvent>(
      (event, emit) async {
        emit(MyBookingLoadingState());
        try {
          final List booking = await _myBookingRepository.myBookingData();
          emit(
            MyBookingSuccessState(booking),
          );
        } on AppException catch (e) {
          emit(
            MyBookingErrorState(e),
          );
        }
      },
    );
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salon_customer_app/domain/repositories/salon_list_repository.dart';

import '../../../../common/exception/app_exception.dart';

part 'salon_list_event.dart';
part 'salon_list_state.dart';

class SalonListBloc extends Bloc<SalonListEvent, SalonListState> {
  final SalonListRepository _salonListRepository = SalonListRepository();

  SalonListBloc() : super(SalonListInitial())  {
    on<GetSalonListEvent>((event, emit) async {
      emit(SalonListLoadingState());
      try {
        final List todayBookings = await _salonListRepository.getAllSalonData();
        emit(SalonListSuccessState(todayBookings));
      } on AppException catch (e) {
        emit(SalonListErrorState(e));
      }
    });
  }
}

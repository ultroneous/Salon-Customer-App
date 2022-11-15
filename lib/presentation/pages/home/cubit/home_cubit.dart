import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_customer_app/domain/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository = HomeRepository();
  HomeCubit() : super(HomeInitial());
  void getdata() async {
    emit(HomeLoading());
    try {
      final List data = await _homeRepository.getbannerData();
      emit(HomeSuccess(data));
    } on Exception catch (_) {
      emit(HomeError());
    }
  }
}

part of 'salon_list_bloc.dart';

abstract class SalonListState extends Equatable {
  const SalonListState();
}

class SalonListInitial extends SalonListState {
  @override
  List<Object?> get props => [];
}

class SalonListLoadingState extends SalonListState {
  @override
  List<Object?> get props => [];
}

class SalonListSuccessState extends SalonListState {
  final List salonList;
  SalonListSuccessState(this.salonList);

  @override
  List<Object?> get props => [salonList];
}

class SalonListErrorState extends SalonListState {
  final AppException exception;
  SalonListErrorState(this.exception);

  @override
  List<Object?> get props => [];
}

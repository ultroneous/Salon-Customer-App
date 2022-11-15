part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState {
  final List? data;
  const HomeSuccess(this.data);
  @override
  List<Object> get props => [data!];
}

class HomeError extends HomeState {
  @override
  List<Object> get props => [];
}

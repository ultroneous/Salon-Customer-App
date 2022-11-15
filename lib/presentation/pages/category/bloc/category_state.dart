part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadingState extends CategoryState{
  @override
  List<Object?> get props => [];
}

class CategorySuccessState extends CategoryState{
  final List categories;
  const CategorySuccessState(this.categories);

  @override
  List<Object?> get props => [categories];
}

class CategoryErrorState extends CategoryState{
  final AppException exception;
  const CategoryErrorState(this.exception);

  @override
  List<Object?> get props => [];
}
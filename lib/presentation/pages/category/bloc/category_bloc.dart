import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salon_customer_app/common/exception/app_exception.dart';
import 'package:salon_customer_app/data/remote/models/category_model.dart';
import 'package:salon_customer_app/domain/repositories/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository = CategoryRepository();

  CategoryBloc() : super(CategoryInitial()) {
    on<GetCategory>(
      (event, emit) async {
        emit(CategoryLoadingState());
        try {
           var categories = await categoryRepository.categories(CategoryModel());
          emit(CategorySuccessState(categories));
        } on AppException catch (e) {
          emit(CategoryErrorState(e));
        }
      },
    );
  }
}
import 'package:salon_customer_app/data/remote/models/category_model.dart';
import 'package:salon_customer_app/domain/repositories/category_repository.dart';

class CategoryUseCase{
  CategoryRepository categoryRepository;

  CategoryUseCase({required this.categoryRepository});
  Future<void> call(CategoryModel category) async {
    return await categoryRepository.categories(category);
  }
}
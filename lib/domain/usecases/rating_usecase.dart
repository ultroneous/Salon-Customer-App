import 'package:salon_customer_app/data/remote/models/rating_model.dart';
import 'package:salon_customer_app/domain/repositories/rating_repository.dart';

class RatingUseCase {
  RatingRepository ratingRepository;

  RatingUseCase({required this.ratingRepository});

  Future<void> call(RatingModel ratingModel) async {
    return await ratingRepository.rating(ratingModel);
  }
}
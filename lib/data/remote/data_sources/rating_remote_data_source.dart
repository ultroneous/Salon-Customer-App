import 'package:salon_customer_app/data/remote/models/rating_model.dart';

abstract class FirebaseRatingRemoteDataSource {
  Future<void> rating(RatingModel ratingModel);
}
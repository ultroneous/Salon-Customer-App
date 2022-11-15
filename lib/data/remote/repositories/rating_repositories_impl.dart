import 'package:salon_customer_app/data/remote/data_sources/rating_remote_data_source.dart';
import 'package:salon_customer_app/data/remote/models/rating_model.dart';
import '../../../domain/repositories/rating_repository.dart';

class RatingRepositoryImpl extends RatingRepository {
  FirebaseRatingRemoteDataSource firebaseRatingRemoteDataSource;
  RatingRepositoryImpl({required this.firebaseRatingRemoteDataSource});

  @override
  Future<void> rating(RatingModel ratingModel) async {
    firebaseRatingRemoteDataSource.rating(ratingModel);
  }
}

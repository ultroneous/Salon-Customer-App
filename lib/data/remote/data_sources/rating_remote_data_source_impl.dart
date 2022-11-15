import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:salon_customer_app/data/remote/data_sources/rating_remote_data_source.dart';
import 'package:salon_customer_app/data/remote/models/rating_model.dart';

class FirebaseRatingRemoteDataSourceImpl
    extends FirebaseRatingRemoteDataSource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<void> rating(RatingModel ratingModel) async {
    final salonCollectionRef = firestore.collection("rating");

    await salonCollectionRef.doc("kuStGjzLYpggJgTyBlfy").get().then(
      (value) async {
        final rating = RatingModel(
          ratingStar: ratingModel.ratingStar,
          ratingComment: ratingModel.ratingComment,
        ).toDocument();
        if(value.exists){
          salonCollectionRef.doc("kuStGjzLYpggJgTyBlfy").set(rating);
        }
      },
    );
  }
}

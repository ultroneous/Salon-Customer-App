import 'package:cloud_firestore/cloud_firestore.dart';

class RatingModel{
  RatingModel({
    this.ratingStar,
    this.ratingComment
});
String? ratingStar;
String? ratingComment;


factory RatingModel.fromSnapshot(DocumentSnapshot documentSnapshot){
  return RatingModel(
    ratingStar: documentSnapshot.get('ratingStar'),
    ratingComment: documentSnapshot.get('ratingComment'),
  );
}

Map<String, dynamic> toDocument(){
  return {
    "ratingStar": ratingStar,
    "ratingComment": ratingComment
  };
}
}
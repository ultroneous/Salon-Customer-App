import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepository {
  static final HomeRepository _singleton = HomeRepository._internal();
  HomeRepository._internal();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  factory HomeRepository() {
    return _singleton;
  }
  Future getbannerData() async {
    List category = [];
    List banner = [];
    List salonsData = [];
    List mostpopulersalonsData = [];
    try {
      CollectionReference categoryAndbanner =
          _firebaseFirestore.collection("banner");
      CollectionReference salonslist = _firebaseFirestore.collection("salons");
      await categoryAndbanner.doc("banner").get().then((value) {
        if (value.exists) {
          value['data'].forEach((doc) {
            banner.add(doc);
          });
        }
      });
      await categoryAndbanner.doc("category").get().then((value) {
        if (value.exists) {
          value['data'].forEach((doc) {
            category.add(doc);
          });
        }
      });
      await salonslist.get().then((value) {
        for (var doc in value.docs) {
          salonsData.add(doc);
        }
      });
      await salonslist
          .where("salonRating", isGreaterThan: 3.5)
          .get()
          .then((value) {
        for (var doc in value.docs) {
          mostpopulersalonsData.add(doc);
        }
      });
    } on FirebaseException catch (_) {}
    return [banner, category, salonsData, mostpopulersalonsData];
  }
}

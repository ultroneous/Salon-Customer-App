


import 'package:cloud_firestore/cloud_firestore.dart';

import '../../common/exception/app_exception.dart';
import '../../common/utils/firbase_constants/firebase_db_const.dart';
import '../../common/utils/firbase_constants/firebase_doc_const.dart';

class SalonListRepository {
  static final SalonListRepository _singleton = SalonListRepository._internal();
  SalonListRepository._internal();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final currentLocalDate = DateTime.now().toUtc().toString().substring(0, 10);
  final upcomingLocalDate =
  int.parse(DateTime.now().toUtc().toString().substring(8, 10));

  factory SalonListRepository() {
    return _singleton;
  }

  Future getAllSalonData() async {
    final List salonDataList;
    try {
      QuerySnapshot querySnapshot =  await _firebaseFirestore.
      collection(FirebaseCollection.salon).get();
      salonDataList = querySnapshot.docs.map((doc) => doc.data()).toList();

    } on FirebaseException catch (error) {
      return AppException(message: error.toString());
    }
    return salonDataList;
  }

}
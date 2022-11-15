import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../common/exception/app_exception.dart';

class MyBookingRepository {
  static final MyBookingRepository _singleton = MyBookingRepository._internal();
  MyBookingRepository._internal();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final upcomingDate =
      int.parse(DateTime.now().toUtc().toString().substring(8, 10));

  factory MyBookingRepository() {
    return _singleton;
  }

  Future myBookingData() async {
    List upcomingDataList = [];
    List pastDataList = [];
    List upcomingDays = [];
    List pastDays = [];
    Set upcomingDateSet = {};
    Set pastDateSet = {};

    try {
      final salonCollectionRef =
          await _firebaseFirestore.collection("customerbookings");
      await salonCollectionRef.doc("customerbookings").get().then(
        (value) {
          if (value.exists) {
            value.data()!['data'].forEach(
              (doc) {
                var nextDate = int.parse(
                  doc["dateTime"].toString().substring(8, 10),
                );
                if (upcomingDate <= nextDate) {
                  upcomingDataList.add(doc);
                  upcomingDateSet.add(doc["dateTime"].split(" ")[0]);
                } else if (upcomingDate > nextDate) {
                  pastDataList.add(doc);
                  pastDateSet.add(doc["dateTime"].split(" ")[0]);
                }
              },
            );
            upcomingDays = upcomingDateSet.toList();
            upcomingDays.sort(
              (a,b) => a.compareTo(b),
            );
            pastDays = pastDateSet.toList();
            pastDays.sort(
              (a,b) => a.compareTo(b),
            );
          }
        },
      );
    } on FirebaseAuthException catch (error) {
      return AppException(message: error.toString());
    }
    return [upcomingDataList,pastDataList,upcomingDays,pastDays];
  }
}

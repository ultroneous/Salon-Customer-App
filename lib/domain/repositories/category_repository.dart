import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salon_customer_app/data/remote/models/category_model.dart';

import '../../common/exception/app_exception.dart';

class CategoryRepository {
  static final CategoryRepository _singleton = CategoryRepository._internal();

  CategoryRepository._internal();

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  factory CategoryRepository() {
    return _singleton;
  }

  Future categories(CategoryModel category) async {
    List categories = [];
    try {
      final salonCollectionRef = fireStore.collection("banner");
      await salonCollectionRef.doc("category").get().then(
            (value) => {
              if (value.exists)
                {
                  value.data()!['data'].forEach(
                    (doc) {
                      categories.add(doc);
                    },
                  ),
                },
            },
          );
    } on FirebaseAuthException catch (error) {
      return AppException(message: error.toString());
    }
    return categories;
  }
}

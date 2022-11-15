import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  CategoryModel({
    this.id,
    this.name,
    this.image
});

String? id;
String? image;
String? name;

  factory CategoryModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return CategoryModel(
      id: documentSnapshot.get("id"),
      name: documentSnapshot.get("name"),
      image: documentSnapshot.get("image"),
    );
  }
  Map<String, dynamic> toDocument() {
    return {
      "id": id,
      "name": name,
      "image": image,
    };
  }
}
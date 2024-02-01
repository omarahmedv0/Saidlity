import 'package:firebase_core/firebase_core.dart';
import 'package:saidlity/data/models/category_model.dart';
import 'package:saidlity/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RemoteDataSource {
  Future<QuerySnapshot<Map<String, dynamic>>> getCategoriesData();
  Future<QuerySnapshot<Map<String, dynamic>>> getPopularProduct();
  Future<QuerySnapshot<Map<String, dynamic>>> getCategoryProducts(String categoryID);


}

class RemoteDataSourceIMPL implements RemoteDataSource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getCategoriesData() async {
    QuerySnapshot<Map<String, dynamic>> res =
        await firestore.collection('categories').get();
    return res;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPopularProduct() async {
    QuerySnapshot<Map<String, dynamic>> res =
        await firestore.collection('popular_products').get();
    return res;
  }
  
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getCategoryProducts(String categoryID)async {
       QuerySnapshot<Map<String, dynamic>> res =
        await firestore.collection('categories').doc(categoryID).collection('products').get();
    return res;
  }
  

}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saidlity/data/data_source/remote_data_source.dart';
import 'package:saidlity/data/models/category_model.dart';
import 'package:saidlity/data/models/product_model.dart';
import 'package:saidlity/data/repos/home/home_repo.dart';

class HomeRepoIMPL implements HomeRepo {
  RemoteDataSourceIMPL remoteDataSource;
  HomeRepoIMPL({required this.remoteDataSource});
  @override
  Future<List<CategoryModel>> getCategoriesData() async {
    QuerySnapshot<Map<String, dynamic>> res =
        await remoteDataSource.getCategoriesData();
    List<CategoryModel> data = [];
    res.docs.forEach((element) {
      data.add(CategoryModel.fromJSON(element.data()));
    });
    print(data[0].name);

    return data;
  }

  @override
  Future<List<ProductModel>> getPopularProductsData() async {
    QuerySnapshot<Map<String, dynamic>> res =
        await remoteDataSource.getPopularProduct();
    List<ProductModel> data = [];
    res.docs.forEach((element) {
      data.add(ProductModel.fromJSON(element.data()));
    });
    print(data[0].name);
    return data;
  }
  
  @override
  Future<List<ProductModel>> getCategoryProductsData(String categoryID) async{
  QuerySnapshot<Map<String, dynamic>> res =
        await remoteDataSource.getCategoryProducts(categoryID);
    List<ProductModel> data = [];
    res.docs.forEach((element) {
      data.add(ProductModel.fromJSON(element.data()));
    });
    print(data[0].name);
    return data;
  }
}

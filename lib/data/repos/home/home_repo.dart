import 'package:saidlity/data/models/category_model.dart';
import 'package:saidlity/data/models/product_model.dart';

abstract class HomeRepo {
  Future<List<CategoryModel>> getCategoriesData();
  Future<List<ProductModel>> getPopularProductsData();
  Future<List<ProductModel>> getCategoryProductsData(String categoryID);

}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:saidlity/data/models/category_model.dart';
import 'package:saidlity/data/models/product_model.dart';
import 'package:saidlity/data/repos/home/home_repo.dart';
import 'package:saidlity/data/repos/home/home_repo_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  HomeRepoIMPL homeRepo;
  List<CategoryModel> categoriesData = [];
  List<ProductModel> popularProducts = [];
  List<ProductModel> productsData = [];
  List<ProductModel> searchData = [];

  static HomeCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  String categoryName = "";
  filterProductsData(String text) {
    searchData = [];
    for (var element in productsData) {
      if (element.name!.toUpperCase().startsWith(text.toUpperCase())) {
        searchData.add(element);
      }
    }
  }

  getCategoriesData() async {
    emit(GetHomeCategoriesDataLoading());
    categoriesData = [];
    try {
      categoriesData = await homeRepo.getCategoriesData();
      emit(GetHomeCategoriesDataSuccess());
    } catch (e) {
      emit(GetHomeCategoriesDataFailed());
    }
  }

  getPopularProductsData() async {
    emit(GetPopularProductsDataLoading());
    popularProducts = [];
    try {
      popularProducts = await homeRepo.getPopularProductsData();
      emit(GetHomeCategoriesDataSuccess());
    } catch (e) {
      emit(GetHomeCategoriesDataFailed());
    }
  }

  getCategoryProductsData(String categoryID) async {
    emit(GetCategoryProductsDataLoading());
    productsData = [];
    try {
      productsData = await homeRepo.getCategoryProductsData(categoryID);
      emit(GetCategoryProductsDataSuccess());
    } catch (e) {
      emit(GetCategoryProductsDataFailed());
    }
  }
}

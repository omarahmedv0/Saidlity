part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}


class GetHomeCategoriesDataSuccess extends HomeState {}

class GetHomeCategoriesDataLoading extends HomeState {}

class GetHomeCategoriesDataFailed extends HomeState {}

class GetPopularProductsDataSuccess extends HomeState {}

class GetPopularProductsDataLoading extends HomeState {}

class GetPopularProductsDataFailed extends HomeState {}


class GetCategoryProductsDataSuccess extends HomeState {}

class GetCategoryProductsDataLoading extends HomeState {}

class GetCategoryProductsDataFailed extends HomeState {}

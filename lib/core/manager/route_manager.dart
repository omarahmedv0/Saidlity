import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saidlity/injections.dart';
import 'package:saidlity/view/screens/app_layout.dart';
import 'package:saidlity/view/screens/home_screen.dart';
import 'package:saidlity/view/screens/products_screen.dart';
import 'package:saidlity/view_model/home/home_cubit.dart';

class AppRoutes {
  static const String appLayout = '/';
  static const String productScreen = '/productScreen';
}

Map<String, Widget Function(BuildContext)> routesManager = {
  AppRoutes.appLayout: (c) => const AppLayout(),
  AppRoutes.productScreen: (p0) => const ProductScreen(),
};

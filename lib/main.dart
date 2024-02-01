import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saidlity/core/manager/route_manager.dart';
import 'package:saidlity/core/styles/app_theme.dart';
import 'package:saidlity/injections.dart';
import 'package:saidlity/view_model/home/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCptRZz1GwvADicUEBE2kEq1IijtnJtbY0",
      appId: "1:426971748367:android:3e6e674a1b291f5574eb7a",
      messagingSenderId: "426971748367",
      projectId: "saidlity-9cb88",
    ),
  );
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return BlocProvider(
      create: (context) => HomeCubit(servLocator.get())
        ..getCategoriesData()
        ..getPopularProductsData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        routes: routesManager,
      ),
    );
  }
}

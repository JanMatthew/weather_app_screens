import 'package:flutter/material.dart';
import 'package:weather_app/config/router/routes.dart';
import 'package:weather_app/presentation/screens/login.dart';
import 'package:weather_app/presentation/screens/province.dart';
import 'package:weather_app/presentation/screens/region.dart';
import 'package:weather_app/presentation/screens/info_comarca_1.dart';
import 'package:weather_app/presentation/screens/info_comarca_2.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
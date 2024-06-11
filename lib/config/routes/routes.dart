import 'package:cuteapp/config/routes/app_routes.dart';
import 'package:cuteapp/pages/home_page.dart';
import 'package:cuteapp/pages/inicio_page.dart';
import 'package:cuteapp/pages/splash_page.dart';
import 'package:cuteapp/presentation/screens/auth/loginScreen.dart';
import 'package:cuteapp/presentation/screens/auth/registerScreen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> appRoutes={
  Routes.splash:(_)=> const SplashPage(),
  Routes.home:(_)=> const HomePage(),
  Routes.inicio:(_)=> const IniciPage()
//  Routes.login:(_)=> const LoginScreen(),
// Routes.register:(_)=> const RegisterScreen(),


};
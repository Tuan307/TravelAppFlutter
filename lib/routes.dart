import 'package:flutter/material.dart';
import 'package:socialappflutter/ui/forget_password/forget_password_screen.dart';
import 'package:socialappflutter/ui/login/login_screen.dart';
import 'package:socialappflutter/ui/main_screen/main_screen.dart';
import 'package:socialappflutter/ui/main_screen/profile/profile_screen.dart';
final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
};
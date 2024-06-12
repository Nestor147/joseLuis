import 'package:cuteapp/presentation/screens/auth/registerScreen.dart';
import 'package:cuteapp/presentation/screens/screen.dart';
import 'package:flutter/material.dart';


class Auth_Page extends StatefulWidget {
   Auth_Page({super.key});

  @override
  State<Auth_Page> createState() => _Auth_PageState();
}

class _Auth_PageState extends State<Auth_Page> {
  bool a =false;

  void to(){
    setState(() {
      a=!a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(a){
      // return LoginScreen(to);
      return LoginScreen();
    }else{
      // return RegisterScreen(to);
      return RegisterScreen();
    }
  }
}
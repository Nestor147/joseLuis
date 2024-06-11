import 'package:cuteapp/presentation/screens/auth/auth_page.dart';
import 'package:cuteapp/presentation/screens/auth/loginScreen.dart';
import 'package:cuteapp/presentation/screens/home/components/sectionsButtonsforScreens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const  HomeScreenAnimated();
          }else{
            // return HomeScreenAnimated();
            return Auth_Page();
          }
        },
      ),
    );
  }
}
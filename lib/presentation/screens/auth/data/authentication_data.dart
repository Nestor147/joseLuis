

import 'package:cuteapp/presentation/screens/auth/datasource/authentication_dataSource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationRemote extends AuthenticationDataSource{

  @override
  Future<void> login(String email, String password) async {
    var usuario= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
    print("lo que nos devuelve es $usuario");

  }

  @override
  Future<void> register(String email, String password, String confirmPassword) async {
    
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    
  }

}
import 'package:flutter/material.dart';

abstract class AuthenticationDataSource{
  Future<void> register(String email,String password, String confirmPassword);
  Future<void> login(String email,String password);
  
}
import 'package:flutter/material.dart';

abstract class AuthenticationDataSourceUsers{
  Future<String> register(String email,String password, String confirmPassword);
  Future<String> loginFireBaseAuth(String email,String password);
  
}
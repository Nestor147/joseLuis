import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_provider.g.dart';

enum AuthStatus {notAuthentication, chaeking, authenticated}

@riverpod
class LoginProvider extends _$LoginProvider {
  @override
   AuthStatus build() {

    AuthStatus authStatus=AuthStatus.notAuthentication;
    return authStatus ;
  }
  Future<void> loginUser({
    required String usernameOrEmail,
     required String password,
     required Function onSuccess,
     required Function(String) onError})
     async{
    final FirebaseAuth _auth= FirebaseAuth.instance;
    final FirebaseFirestore _firestore=FirebaseFirestore.instance;
      try{
        state=AuthStatus.chaeking;
        final String usernameOrEmailLowerCase=usernameOrEmail.toLowerCase();
        final QuerySnapshot result=await _firestore
        .collection('users')
        .where('username_lowercase', isEqualTo: usernameOrEmailLowerCase)
        .limit(1)
        .get();
        if(result.docs.isNotEmpty){
          final String email=result.docs.first.get('email');
          final UserCredential userCredential =await _auth.signInWithEmailAndPassword(
            email: email,
             password: password);
            onSuccess();
            return;
        }
        onError('No se encontró el usuario o email ingresado.');
        
        
      } on FirebaseAuthException catch(e){
        if(e.code=='user-not-found' || e.code=='wrong-password'){
          onError('Usuario o contraseña incorrecta');
        }else{
          onError(e.toString());
        }
      }
      catch(e){
        onError(e.toString());
      }
     }
     //verificar el estado del usuario
     void checkAuthState(){
      final FirebaseAuth _auth= FirebaseAuth.instance;
      AuthStatus authStatus=AuthStatus.notAuthentication;
      _auth.authStateChanges().listen((User? user) {
        if(user==null){
          authStatus=AuthStatus.notAuthentication;
        }else{
          authStatus=AuthStatus.authenticated;
        }
        
      });
     }


     //obtener datos del usuario
     Future<dynamic> getUserData(String email) async{
      final FirebaseFirestore _firestore=FirebaseFirestore.instance;
      final QuerySnapshot<Map<String, dynamic>> result=await _firestore
      .collection('users')
      .where('email',isEqualTo: email)
      .limit(1)
      .get();
      if(result.docs.isNotEmpty){
        final userData = result.docs[0].data();
        return userData;
      }
      return null;
     }

     
}
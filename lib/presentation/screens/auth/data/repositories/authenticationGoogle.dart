

import 'package:cuteapp/presentation/screens/auth/datasource/auth_google_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationGoogleRemote extends AuthenticationGoogle{
  @override
  Future<void> authGoogle() async{
        final FirebaseAuth _auth=FirebaseAuth.instance;
    final GoogleSignIn _googleSign=GoogleSignIn();
    try{
      final GoogleSignInAccount? googleSignInAccount =await _googleSign.signIn();
      if(googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
        final AuthCredential credential=GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken
        );
        await _auth.signInWithCredential(credential);
      }

    }catch (e){
      print("Error $e");
    }
  }

}
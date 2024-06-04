import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_provider.g.dart';

enum UserRole{admin, user, superAdmin}

@riverpod
class Register extends _$Register {
  @override
  String build() {
       final FirebaseAuth _auth= FirebaseAuth.instance;
    final FirebaseFirestore _firestore=FirebaseFirestore.instance;
    final FirebaseStorage _storage=FirebaseStorage.instance;
    return "";
  }

  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
    required UserRole rol,
    required String birth,
    required String age,
    required String token,
    required String createdAt,
    required File? image,
     required Function(String) onError})async{
    try{
      final FirebaseAuth _auth= FirebaseAuth.instance;
        final FirebaseFirestore _firestore=FirebaseFirestore.instance;
      //convertir el usuario a minusculas
      final String usernameLowerCase=username.toLowerCase();

      //verificar si el usuario ya existe en la base de datos de fire base
      final bool userExit=await chekUserExist(usernameLowerCase);
      if(userExit){
        onError('El usuario ya existe');
        return ;
      }
      //verificar las credenciales 
      final UserCredential userCredential=await _auth.createUserWithEmailAndPassword(
        email: email,
         password: password);

         final User user=userCredential.user!;
         final String userId=user.uid;

         //subir la imagen
         String imageURL='';
         if(image !=null){
          String direction='users/$username/$userId.jpg';
          imageURL=await uploadImage(direction, image);
         }
         //guardar los datos del usuario en la base de datos

         final userDatos={
          'id':userId,
          'username':username,
          'username_lowercase':usernameLowerCase,
          'password':password,
          'email':email,
          'rol':rol,
          'birth':birth,
          'age':age,
          'token':token,
          'image':image,
          'createdAt':createdAt
         };
         await _firestore.collection('users').doc(userId).set(userDatos);
    } on FirebaseAuthException catch(e){
      if(e.code=='weak-password'){
        onError('La contraseña es muy debil');
      }else if(e.code=='email-already-in-use'){
        onError('El email ya está en uso');
      }else{
        onError(e.toString());
      }
    
    


    }catch(e){
     onError("Error al registrar usuario");
    }
  }
  //metodo para verificar si el usuario ya existe en l base de datos
  Future<bool> chekUserExist(String username) async{
    final FirebaseFirestore _firestore=FirebaseFirestore.instance;

    final QuerySnapshot result=await _firestore
    .collection('users')
    .where('username',isEqualTo: username)
    .limit(1)
    .get();

    return result.docs.isNotEmpty;
  }

  //metodo para verificar si el email ya existe en la base de datos
  Future<bool> chekEmailExist(String email) async{
    final FirebaseFirestore _firestore=FirebaseFirestore.instance;

    final QuerySnapshot result=await _firestore
    .collection('users')
    .where('email',isEqualTo: email)
    .limit(1)
    .get();

    return result.docs.isNotEmpty;
  }

  //metodo para guardar la imagen en storage y obtene rla URL
  Future<String> uploadImage(String direcion, File file )async{
    final FirebaseStorage _storage=FirebaseStorage.instance;
    final uploadTask=_storage.ref().child(direcion).putFile(file);
    final TaskSnapshot taskSnapshot=await uploadTask;
    final String url=await taskSnapshot.ref.getDownloadURL();
    return url;
  }

}




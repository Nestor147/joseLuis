
import 'package:cuteapp/presentation/provider/customUser_provider.dart';
import 'package:cuteapp/presentation/screens/auth/datasource/authentication_users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';



class AuthenticationRemoteUsers extends AuthenticationDataSourceUsers{


@override
Future<String> loginFireBaseAuth(String email, String password) async {
  await Firebase.initializeApp();
  // Obtiene la referencia a la colección de usuarios
  CollectionReference usersRef = FirebaseFirestore.instance.collection('Users');
   // Filtra los resultados por el email
  Query query = usersRef.where('email', isEqualTo: email);
  // Filtra los resultados por la contraseña
  query = query.where('password', isEqualTo: password);
  String errorMetodo="Error";
   await query.get().then((QuerySnapshot snapshot) async {
    final bool isValid = EmailValidator.validate(email);
    if(isValid){
    bool validar=true;
    try{
       print("no existen registros ${snapshot.docs.first.data()}") ;
       validar=true;       
    }catch (e){
      print("el error es ${e}");
       validar=false;
    }
    print("la validacion es  $validar");
    if(validar){
       var userData = snapshot.docs.first.data() as Map<String, dynamic>;
      print(userData);
      var userId=snapshot.docs.first.id;
      final String nameUser =userData['name'];
      final String emailUser=userData['email'];
      final bool activateUser=userData['state'];
      final String roleUser=userData['role'];
      final String idUser=userId; 
      print(idUser);
      print(nameUser);
      print(emailUser);
      print(activateUser);
      print(roleUser);
      // ref.read(customUserProvider.notifier).setUser(idUser,nameUser,emailUser,activateUser,roleUser);
      
       errorMetodo=await [0,idUser,nameUser,emailUser,activateUser,roleUser,0].toString();
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password.trim());

    }
    else{
        errorMetodo="Password";
        print(errorMetodo);
    }
    }
    else{
      errorMetodo="Email";
      print(errorMetodo);

    }
  });
print(errorMetodo);
  return errorMetodo;
}




  @override
 Future <String> register( String name,String email, String password) async {
  var db = FirebaseFirestore.instance;
  String messageResult="Registrado";
    final bool isValid = EmailValidator.validate(email);
try {
  // print("la validacion es $isValid");
    if(isValid){
     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(),password: password.trim());
    // print("EL Usuario se esta creando");
         var usuario = FirebaseAuth.instance.currentUser!;
        var usuarios =  db.collection("Users");
        var documento = usuarios.doc(usuario.uid);
        var datosUsuario = {
          "name": name,
          "email": email,
          "password": password,
          "role": "Estudiante",
          "state": true,
        } ;
       await documento.set(datosUsuario);
        messageResult="RegistradoExito";
        // print(messageResult);
         await Firebase.initializeApp();
  // Obtiene la referencia a la colección de usuarios
   CollectionReference usersRef = FirebaseFirestore.instance.collection('Users');
   // Filtra los resultados por el email
  Query query = usersRef.where('email', isEqualTo: email);
  // Filtra los resultados por la contraseña
  query = query.where('password', isEqualTo: password);
  // String errorMetodo="Error";
   await query.get().then((QuerySnapshot snapshot) async {
    final bool isValid = EmailValidator.validate(email);
    if(isValid){
    bool validar=true;
    try{
      //  print("no existen registros ${snapshot.docs.first.data()}") ;
       validar=true;       
    }catch (e){
      // print("el error es ${e}");
       validar=false;
    }
    // print("la validacion es  $validar");
    if(validar){
       var userData = snapshot.docs.first.data() as Map<String, dynamic>;
      // print(userData);
      var userId=snapshot.docs.first.id;
      final String nameUser =userData['name'];
      final String emailUser=userData['email'];
      final bool activateUser=userData['state'];
      final String roleUser=userData['role'];
      final String idUser=userId; 
      
      print(idUser);
      print(nameUser);
      print(emailUser);
      print(activateUser);
      print(roleUser);
      // await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,password: password);
    
    }
    else{
        // errorMetodo="Password";
        print("password");
    }
    }
    else{
      // errorMetodo="Email";
      print("Email");
    }
  }
   );
        // return messageResult;
    // await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(),password: password.trim());
    }else{
      // print("email incorrecto");
      messageResult="EmailIncorrecto";
    }
  } catch (e) {
    print(e.hashCode.toString());
    // Si la creación del usuario falla, imprime un mensaje de error.
    print("El usuario no se pudo registrar ${e.toString()}");
    // messageResult=e.toString();
  }
  return messageResult;
}
}







// @override
// Future<void> loginFireBaseAuth(String email, String password) async {
//   // Crea una instancia de la base de datos de Firestore.
//   // var db = FirebaseFirestore.instance;

//   try {
//     // Inicia sesión al usuario.
//     var usuario= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,password: password);
//     print("los datos del usuario son $usuario");

//     // Obtén los datos del usuario del documento.
//     var documento = await FirebaseFirestore.instance.collection("Users").doc(usuario?.user?.uid);
//     var datosUsuario = await documento?.get();

//     // Si el usuario está registrado, inicia sesión en la aplicación.
//     if (datosUsuario != null) {
//       var datosUsuarioMap = datosUsuario.data();
//       if (datosUsuarioMap?['email']==email && datosUsuarioMap?['password'] == password) {
//         // El usuario y la contraseña son iguales.
//         // Inicia sesión en la aplicación.
//         print("los datos del usuario son ${datosUsuarioMap}");
//         print("El usuario y la contraseña son iguales");
//       } else {
//         // El usuario y la contraseña no son iguales.
//         // No permite el acceso a la aplicación.
//         print("El usuario y la contraseña no son iguales");
//       }
//     } else {
//       // El usuario no está registrado.
//       print("El usuario no está registrado");
//     }
//   } catch (e) {
//     // La contraseña es incorrecta.
//     print("el usuario no existe ${e.toString()}");
//   }
// }

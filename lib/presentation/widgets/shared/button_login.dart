import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  const ButtonLoginWidget({
    super.key,
   required this.text, 
   required this.onPressed, 
    this.color=const Color.fromARGB(255, 3, 30, 52)});

  

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 64,                       
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(10),
              color: color,
              onPressed: onPressed,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "MonB",
                  color: Colors.white,
                ),
              ),                        
            ),  
    );
  }
}




































// import 'package:flutter/material.dart';

// class ButtonLoginWidget extends StatelessWidget {
//   const ButtonLoginWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       height: 64,                       
//                         child: ElevatedButton(                        
//                           onPressed: () async {
//                             emailFocusNode.unfocus();
//                             passwordFocusNode.unfocus();
//                             final email = emailController.text;
//                             final password = passwordController.text;
//                             if (email.isEmpty || password.isEmpty) {
//                         // Muestra un mensaje de error al usuario si falta información
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Por favor, completa todos los campos.'),
//                           ),
//                         );
//                         return;
//                         }else{
//                         showDialog(context: context, builder:(context){ 
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         });
//                         try{
//                          final String response= await AuthenticationRemoteUsers().loginFireBaseAuth(email, password);
//                          print("credenciales usuario ${response}");
//                          final dataUser= await response;
//                          var userDataList =await dataUser.split(',');
           
//                            ref.read(usuarioPersistenteProvider.notifier).saveUserData(userDataList[1].trim(), userDataList[2].trim(),userDataList[3].trim(), userDataList[5].trim());
 

                                          
//                          print("los datos del usuario son ${dataUser}");
                         
//                          if(response=="Email"){
//                           final String message="email incorrecto";
//                              errorMessage(message);
//                                  ScaffoldMessenger.of(context).showSnackBar(
//                            SnackBar(
//                             backgroundColor: Colors.red,
//                             content: Text(message),
//                           ),     
//                         );
//                           Navigator.pop(context);
                        
//                          }else if(response=="Password"){
//                             final String messagePassword="Contraseña incorrecta";
//                            errorMessage(messagePassword);
//                             ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             backgroundColor: Colors.red,
//                             content: Text(messagePassword),
//                           ),
//                         );
//                         // 
//                            Navigator.pop(context);
//                          }
//                          //espera    
//                           Navigator.pop(context);
//                          }
//                          on FirebaseAuthException catch (e){
//                           Navigator.pop(context);
//                            if(e.code == 'invalid-email'){
//                             final String message="email incorrecto";
//                              errorMessage(message);
//                             ScaffoldMessenger.of(context).showSnackBar(
//                            SnackBar(
//                             backgroundColor: Colors.red,
//                             content: Text(message),
//                           ),     
//                         );
//                            }else if(e.code=='INVALID_LOGIN_CREDENTIALS'){
//                             final String messagePassword="Contraseña incorrecta";
//                              errorMessage(messagePassword);
//                             ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             backgroundColor: Colors.red,
//                             content: Text(messagePassword),
//                           ),
//                         );
//                            }
//                           Navigator.pop(context);
                           
//                          }
//                          }
//                           },
                      
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: colorTheme.secondary,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(16), 
//                             ),
//                           ),
//                           child:  Text("Login",style: TextStyle(fontSize: 18,color: colorTheme.background),),
//                         ),
                      

//                     );
//   }
// }
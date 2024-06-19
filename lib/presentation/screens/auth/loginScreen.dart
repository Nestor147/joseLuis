

import 'package:cuteapp/config/services/local_storage.dart';
import 'package:cuteapp/config/validators/validator.dart';
import 'package:cuteapp/env/environment.dart';
import 'package:cuteapp/presentation/provider/appTheme_provider.dart';
import 'package:cuteapp/presentation/services/authentication.service.dart';
import 'package:cuteapp/presentation/widgets/church/churchScreen.dart';
import 'package:cuteapp/presentation/widgets/shared/button_login.dart';
import 'package:cuteapp/presentation/widgets/shared/customtextFormFile.dart';
import 'package:cuteapp/presentation/widgets/utils/showsnacbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/themes/appTheme.dart';


class LoginScreen extends ConsumerStatefulWidget {
  // final VoidCallback show;

  //  LoginScreen( this.show);
   LoginScreen();

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {


  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
    FocusNode emailFocusNode = FocusNode();
  TextEditingController emailOrEmailController = TextEditingController();

  

  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();


  bool isObscure=true;
  bool _isLoading=false;
  static String? token;

  /// rive controller and input
  StateMachineController? controller;

  SMIInput<bool>? isChecking;
  SMIInput<double>? numLook;
  SMIInput<bool>? isHandsUp;

  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  @override
  void initState() {
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    super.initState();
  }
  @override
  void dispose() {
    emailFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
    super.dispose();
    emailOrEmailController.dispose();
    passwordController.dispose();
  }

  //loguearse
  void onFormLogin(String usernameOrEmail, String password, contextTemp) async{
  
    var response = await AuthenticationService().loginUser(usernameOrEmail, password);
    // print('HTTP: $response');
    showSnackbar(contextTemp, response);
    var assertLogin = LocalStorage().getIsLoggedIn();
    if(assertLogin) {
      // FIXME: NV 6.12.24
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChurchScreen()));
      // Navigator.pushNamedAndRemoveUntil(context, '/church', (route) => false);
    }
  }

  void emailFocus() {
    isChecking?.change(emailFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }



   void errorMessage(String message){
    showDialog(context: context, builder: (context){
      return  AlertDialog(
        icon: Icon(Icons.error),
        backgroundColor: Colors.red,
        title: Text(message),
      );
    });
  }

  void signGoogleAuth() async{
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
      errorMessage(e.toString());
    }
  }

    Future<void> saveUserData(String id, String name, String email, String role) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('id', id);
  await prefs.setString('name', name);
  await prefs.setString('email', email);
  await prefs.setString('role', role);
}

// Cargar los datos del usuario
Future<Map<String, String>> loadUserData() async {
  final prefs = await SharedPreferences.getInstance();
  return {
    'id': prefs.getString('id') ?? "0",
    'name': prefs.getString('name') ?? "Sin nombre",
    'email': prefs.getString('email') ?? "Sin email",
    'role': prefs.getString('role') ?? "Sin role",
  };
}

  @override
  Widget build(BuildContext context) {
    final colorTheme=Theme.of(context).colorScheme;

    return Scaffold(


      backgroundColor: Color.fromARGB(255, 253, 194, 0),
      resizeToAvoidBottomInset: true,
      body: Center(child: 
      SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Consumer(
            builder:(BuildContext context,WidgetRef ref, child) {

            
            final isdarkMode=ref.watch(appThemeGlobalProvider);


          return Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 10),
              Container(
                
                decoration: BoxDecoration(
                  color: Colors.transparent,
               
                ),
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Text("Inicio Usuario",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      SizedBox(height: 25,),
                      CustomTextFormField(
                        icon: Icons.mail,
                         colorTheme: colorTheme, 
                         focusNode: emailFocusNode, 
                         controller: emailOrEmailController,
                         typeName: "name@gmail.com",
                         labelText: "User",
                         estado: false,
                         keyboardType:TextInputType.emailAddress,
                         validator: Validators.emailOrUser, ),
                      const SizedBox(height: 25),
                      CustomTextFormField(
                        icon: Icons.lock,
                        colorTheme: colorTheme, 
                        focusNode: passwordFocusNode,
                        controller: passwordController,
                        typeName: "******",
                        labelText: "Password",
                        estado: false,
                        keyboardType:TextInputType.visiblePassword,
                        validator: Validators.passwordValidator, ),
                  
                      const SizedBox(height: 20),
                      
                      const SizedBox(height: 15),
                      _isLoading ? CircularProgressIndicator()
                      : ButtonLoginWidget(
                        text: "Ingresar", 
                        onPressed: (){
                          onFormLogin(
                            emailOrEmailController.text ,
                             passwordController.text,
                              context);
                        }),
                        SizedBox(height: 15,),
                          SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(""),
                            const SizedBox(width: 5,),
                            GestureDetector(
                              onTap: () {    
                                context.go('/register');
                              },
                              child:  const Text(
                                "Registrarse",
                                style: TextStyle(
                                  color: colorSDATheme
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              )
            ],
          );
                    }
        ),
      ),)
    );
  }
}


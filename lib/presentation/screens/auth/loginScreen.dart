

import 'package:cuteapp/config/services/local_storage.dart';
import 'package:cuteapp/config/services/push_notification.dart';
import 'package:cuteapp/config/validators/validator.dart';
import 'package:cuteapp/env/environment.dart';
import 'package:cuteapp/pages/inicio_page.dart';
import 'package:cuteapp/presentation/provider/User_provider.dart';
import 'package:cuteapp/presentation/provider/UsuarioPersistente_provider.dart';
import 'package:cuteapp/presentation/provider/appTheme_provider.dart';
import 'package:cuteapp/presentation/provider/auth/login_provider.dart';
import 'package:cuteapp/presentation/provider/customUser_provider.dart';
import 'package:cuteapp/presentation/screens/auth/data/authentication_data.dart';
import 'package:cuteapp/presentation/screens/auth/data/repositories/authentication_users_repositori.dart';
import 'package:cuteapp/presentation/services/authentication.service.dart';
import 'package:cuteapp/presentation/widgets/church/churchScreen.dart';
import 'package:cuteapp/presentation/widgets/shared/button_login.dart';
import 'package:cuteapp/presentation/widgets/shared/customtextField.dart';
import 'package:cuteapp/presentation/widgets/shared/ImageLogin.dart';
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
    token=PushNotificationService.token;
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
    // FIXME: FM 6.11.24
    // final loginuserProvider=ref.watch(loginProviderProvider.notifier);
    // if(_formkey.currentState!.validate()){
    //   setState(() {
    //     _isLoading=true;
    //   });
    //   final String usernameOrEmailLower=usernameOrEmail.toLowerCase();
    //   loginuserProvider.loginUser(
    //     usernameOrEmail:usernameOrEmailLower ,
    //      password: password,
    //       onSuccess: ()async {
    //         //si el usuario ha verificado su correo electronico
    //         User? user=FirebaseAuth.instance.currentUser;
    //           if(user!=null && user.emailVerified){
    //           //verificar si el usuario ha verificado su correo electronico
    //           setState((){
    //           _isLoading=false;
    //         });
    //         dynamic userData=await loginuserProvider.getUserData(user.email!);
    //         //guardar datos de local
    //         await LocalStorage().saveUserData(emailOrEmailController.text, passwordController.text);
    //         //guardar estado de inicio de sesion
    //         await LocalStorage().setIsSignedIn(true);
    //         //cambiar estado de autenticacion
    //         loginuserProvider.checkAuthState();

    //         //navegar al inicio 
    //         Navigator.pushReplacement(context,
    //          MaterialPageRoute(builder: (context){
    //           return IniciPage(userData:userData);
    //          }));
    //         //Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    //           }else{
    //             //si el usuario no ha verificado su correo electronico
    //             setState((){
    //           _isLoading=false;
    //         });
    //         await showDialog(context: context,
    //          builder: (context){
    //           return AlertDialog(
    //             title: const Text("Verifica tu correo"),
    //             content: const Text("Por favor verifica tu correo electrónico para continuar"),
    //             actions: [
    //               TextButton(onPressed: (){
    //                 Navigator.pop(context);
    //               },
    //                child: const Text("Aceptar"))
    //             ],
    //           );
    //          });
    //           }

    //       },
    //        onError: (String error){
    //         setState(() {
    //           _isLoading=false;
    //         });
    //       showSnackbar(context, error.toString());
    //        });
    // }else{
    //   setState(() {
    //     _isLoading=false;
    //   });
    // }

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

      backgroundColor: const Color(0xFFD6E2EA),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Consumer(
            builder:(BuildContext context,WidgetRef ref, child) {
            // final loginuser=ref.watch(loginProvider);
            // final customUser=ref.watch(authCustomUsuerProvider);
            
            final isdarkMode=ref.watch(appThemeGlobalProvider);


          return Column(
            children: [
              const SizedBox(height: 10),
           
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  style: IconButton.styleFrom(
                    // backgroundColor: colorTheme.background
                  ),
                         icon:Icon( isdarkMode
                         ? Icons.light_mode_outlined
                         : Icons.dark_mode_outlined,
                        color: isdarkMode
                         ? Colors.yellow
                         : const Color.fromARGB(255, 4, 51, 90),
                            size: 45,
                          ), 
                          onPressed: () {
                            ref.read(appThemeGlobalProvider.notifier).setTheme();
                           },
                 ),
              ),
        
         
              const SizedBox(height: 2),
              Text( isdarkMode?
                Environment.APP_NAME:"NetDevs",
                style: TextStyle(
                  // FIXME: FM 6.11.24
                  // color: colorTheme.background,
                  color: colorSDATheme,
                  fontSize: 32,
                  fontWeight: FontWeight.w800
                ),
                
                // style: Theme.of(context).textTheme.headlineMedium,
                
                textAlign: TextAlign.center,
                
              ),
              SizedBox(
                height: 210,
                width: 250,
                child: RiveAnimation.asset(
                  "assets/login-teddy.riv",
                  fit: BoxFit.fitHeight,
                  stateMachines: const ["Login Machine"],
                  onInit: (artboard) {
                    controller = StateMachineController.fromArtboard(
                      artboard,
                      /// from rive, you can see it in rive editor
                      "Login Machine",
                    );
                    if (controller == null) return;
        
                    artboard.addController(controller!);
                    isChecking = controller?.findInput("isChecking");
                    numLook = controller?.findInput("numLook");
                    isHandsUp = controller?.findInput("isHandsUp");
                    trigSuccess = controller?.findInput("trigSuccess");
                    trigFail = controller?.findInput("trigFail");
                  },
                ),
              ),
              Container(
                
                decoration: BoxDecoration(
                  // FIXME: FM 6.11.24
                  // color: const Color.fromARGB(188, 4, 0, 0),
                  color: colorTheme.background,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextFormField(
                        icon: Icons.mail,
                         colorTheme: colorTheme, 
                         focusNode: emailFocusNode, 
                         controller: emailOrEmailController,
                         typeName: "user@gmail.com",
                         labelText: "Ingrese su usuario o contraseña",
                         estado: false,
                         keyboardType:TextInputType.emailAddress,
                         validator: Validators.emailOrUser, ),
                      const SizedBox(height: 8),
                      CustomTextFormField(
                        icon: Icons.lock,
                        colorTheme: colorTheme, 
                        focusNode: passwordFocusNode,
                        controller: passwordController,
                        typeName: "******",
                        labelText: "Ingrese su contraseña",
                        estado: false,
                        keyboardType:TextInputType.visiblePassword,
                        validator: Validators.passwordValidator, ),
                  
                      const SizedBox(height: 15),
                        SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text("No tienes una cuenta?"),
                            const SizedBox(width: 5,),
                            GestureDetector(
                              // onTap: widget.show,
                              onTap: () {
                                // Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => false);
                                context.go('/register');
                              },
                              child:  const Text(
                                "Registrarse",
                                style: TextStyle(
                                  // color: Colors.blue
                                  color: colorSDATheme
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                  
                            
                      // FIXME: FM 6.11.24
                      // const SizedBox(height: 10),
                      // const Row  (
                      //   children: [
                      //     Expanded(
                      //       child: Divider(
                      //         thickness: 1.5 ,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.all(8),
                      //       child: Text("Continuar con..."),
                      //     ),
                      //     Expanded(
                      //       child: Divider(
                      //         thickness: 1.5,
                      //         color:Colors.white
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      //  Row (
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children:  [
                      //     ImageLogin(signGoogle: signGoogleAuth,imagePath: 'assets/google.png'),
                      //     const SizedBox(width: 25,),
                      //     ImageLogin(signGoogle: signGoogleAuth,imagePath:'assets/iphone.png'),
                      //   ],
                      // )
                      
                    ],
                  ),
                ),
              )
            ],
          );
                    }
        ),
      ),
    );
  }
}


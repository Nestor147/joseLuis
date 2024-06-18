import 'dart:io';

import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:cuteapp/config/validators/validator.dart';
import 'package:cuteapp/presentation/provider/appTheme_provider.dart';
import 'package:cuteapp/presentation/widgets/shared/button_login.dart';
import 'package:cuteapp/presentation/widgets/shared/customtextFormFile.dart';
import 'package:cuteapp/presentation/widgets/utils/showsnacbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

import '../../services/authentication.service.dart';


class RegisterScreen extends ConsumerStatefulWidget {
  // final VoidCallback show;

  //  RegisterScreen( this.show);
   RegisterScreen();

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends ConsumerState<RegisterScreen> {

  final GlobalKey<FormState> _formkey =GlobalKey<FormState> ();
  FocusNode usernameFocusNode = FocusNode();
  TextEditingController usernameController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  // FocusNode birthFocusNode = FocusNode();
  // TextEditingController birthController = TextEditingController();
  StateMachineController? controller;

  SMIInput<bool>? isChecking;
  SMIInput<double>? numLook;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;
  // bool _isObscure=true;
  bool _isLoading=false;
  // File? image;
  static String? token;

  @override
  void initState() {
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    // birthFocusNode.addListener(passwordConfirmFocus);
    usernameFocusNode.addListener(nameFocus);

    super.initState();
      emailFocusNode.addListener(() {setState(() {});});
      
    super.initState();
      usernameFocusNode.addListener(() {setState(() {});});

      
    super.initState();
      // birthFocusNode.addListener(() {setState(() {});});

    
    super.initState();
      passwordFocusNode.addListener(() {setState(() {});});
  }
  @override
  void dispose() {
    emailFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
    //  birthFocusNode.removeListener(passwordConfirmFocus);
    usernameFocusNode.removeListener(nameFocus);
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // birthController.dispose();

  }

  //Registrar usuario
  void submitRegister() async {
  
    try {
      var response = await AuthenticationService().registerUser(usernameController.text, emailController.text, passwordController.text);
      showSnackbar(context, response);
      context.go('/');
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void emailFocus() {
    isChecking?.change(emailFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }


   void nameFocus() {
    isChecking?.change(usernameFocusNode.hasFocus);
  }
  @override
  Widget build(BuildContext context) {
    final colorTheme=Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text("Reguistro"),centerTitle: true,),
  
      backgroundColor: const Color(0xFFD6E2EA),
      resizeToAvoidBottomInset: true,
      body:Center(child: 
      SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Consumer(
            builder:(BuildContext context,WidgetRef ref, child) {
            final isdarkMode=ref.watch(appThemeGlobalProvider);
          return Column(
            children: [
              const SizedBox(height: 10),           
              Container(  
                decoration: BoxDecoration(
                  // FIXME: FM 6.11.24
                  // color: Color.fromARGB(188, 4, 0, 0),
                  color:const Color.fromARGB(255, 28, 25, 25),
                
                ),
                padding: const EdgeInsets.all(16),
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      
                      SizedBox(height: 10,),
                        CustomTextFormField(
                          icon: Icons.account_box,
                           colorTheme: colorTheme,
                            focusNode: usernameFocusNode,
                             controller: usernameController,
                             typeName: "Nombre de usuario",
                             labelText: "Usuario",
                             keyboardType: TextInputType.text,
                             estado: false,
                             validator:Validators.validateUsername ,
                             ),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        icon: Icons.mail,
                         colorTheme: colorTheme,
                          focusNode: emailFocusNode,
                          controller: emailController,
                          typeName: "user@gmail.com",
                          labelText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          estado: false,
                          validator: Validators.emailValidator,
                          ),
                      const SizedBox(height: 8),
                      CustomTextFormField(
                        icon: Icons.lock,
                        colorTheme: colorTheme,
                        focusNode: passwordFocusNode,
                        controller: passwordController,
                        typeName: "******",
                        labelText: "Contraseña",
                        estado: false,
                        keyboardType:TextInputType.visiblePassword,
                        validator: Validators.passwordValidator, ),
                      const SizedBox(height: 15),

                        SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(""),
                            SizedBox(width: 5,),
                            GestureDetector(
                              onTap: () {
                                context.go('/');
                              },
                                child:  Text(
                                  "Ingresar",
                                  style: TextStyle(
 
                                    color: colorSDATheme,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                           const SizedBox(height: 30),
                      _isLoading? CircularProgressIndicator(): ButtonLoginWidget(
                        text: "Registrarse", 
                        onPressed: (){
                          submitRegister();
                        }),
                      const SizedBox(height: 15),
                  
                  
                      const SizedBox(height: 10),
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




import 'dart:io';

import 'package:cuteapp/config/services/push_notification.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:cuteapp/config/validators/validator.dart';
import 'package:cuteapp/presentation/provider/appTheme_provider.dart';
import 'package:cuteapp/presentation/provider/auth/register_provider.dart';
import 'package:cuteapp/presentation/screens/auth/data/authentication_data.dart';
import 'package:cuteapp/presentation/screens/auth/data/repositories/authentication_users_repositori.dart';
import 'package:cuteapp/presentation/widgets/shared/button_login.dart';
import 'package:cuteapp/presentation/widgets/shared/customtextField.dart';
import 'package:cuteapp/presentation/widgets/shared/customtextFormFile.dart';
import 'package:cuteapp/presentation/widgets/shared/upload_image.dart';
import 'package:cuteapp/presentation/widgets/utils/showsnacbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rive/rive.dart';


class RegisterScreen extends ConsumerStatefulWidget {
  final VoidCallback show;

   RegisterScreen( this.show);

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

  FocusNode birthFocusNode = FocusNode();
  TextEditingController birthController = TextEditingController();

 

  

  /// rive controller and input
  StateMachineController? controller;

  SMIInput<bool>? isChecking;
  SMIInput<double>? numLook;
  SMIInput<bool>? isHandsUp;

  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  bool _isObscure=true;
  bool _isLoading=false;
  File? image;

  static String? token;

  @override
  void initState() {
  
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    birthFocusNode.addListener(passwordConfirmFocus);
    usernameFocusNode.addListener(nameFocus);
    token=PushNotificationService.token;

    super.initState();
      emailFocusNode.addListener(() {setState(() {});});
      
    super.initState();
      usernameFocusNode.addListener(() {setState(() {});});

      
    super.initState();
      birthFocusNode.addListener(() {setState(() {});});

    
    super.initState();
      passwordFocusNode.addListener(() {setState(() {});});
  }



  

  @override
  void dispose() {
    emailFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
     birthFocusNode.removeListener(passwordConfirmFocus);
    usernameFocusNode.removeListener(nameFocus);
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    birthController.dispose();

  }

  //Registrar usuario
  void submitRegister()async{
    final registerUserProvider=ref.read(registerProvider.notifier);
    // if(true){
    // if(_formkey.currentState!=null && _formkey.currentState!.validate()){
    if(_formkey.currentState!=null){
      setState(() {
        _isLoading=true;
      });
      print("llega hasta aqui 1 ");

      //verificar si el nombre de usuario no existe
      final bool existUserName=await registerUserProvider.chekUserExist(usernameController.text);
      if(existUserName){
        setState(() {
          _isLoading=false;
        });
        showSnackbar(context,"El nombre de usuario ya existe");
        return;
      }
      print("llega hasta aqui 2 ");

      //verificar si el email ya existe
      final bool existEmail=await registerUserProvider.chekEmailExist(emailController.text);
       if(existEmail){
        setState(() {
          _isLoading=false;
        });
        showSnackbar(context,"El email ya existe");
        return;
      }

      //validar que ingrese imagen de perfil
      if(image==null){
        setState(() {
          _isLoading=false;
        });
        showSnackbar(context, "Ingrese una imagen de perfil");
      }
      //obtener fecha y hora actual
      final now =DateTime.now();
      String formatedData=DateFormat('dd/MM/yyyy').format(now);
      //obtener la fecha de nacimiento
      final birth=birthController.text;
      //calcular la edad
      DateTime dateBirth=DateFormat('dd/MM/yyyy').parse(birth);
      int age=now.year-dateBirth.year;
      if(now.month<dateBirth.month || (now.month==dateBirth.month && now.day <dateBirth.day)){
        age--;
      }
      //registrar usuario 
      try{
        await registerUserProvider.registerUser(
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text,
          rol: UserRole.user,
          birth: birthController.text,
          age: age.toString(),
          token: token!,
          createdAt: formatedData,
          image: image,
          onError: (error){
          showSnackbar(context, error);
          });
          //enviar correo de verificacion
          await FirebaseAuth.instance.currentUser!.sendEmailVerification();
          showSnackbar(context, "Revise su correo para verificar su cuenta");
          Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
          setState(() {
            _isLoading=false;
          });
      }on FirebaseAuthException catch(e){
        showSnackbar(context, e.toString());
      }catch(e){
        showSnackbar(context, e.toString());
      }
    }else{
      print("llega aqui por default");
      setState(() {
        _isLoading=false;
      });
    }
  }


  void selectedImage() async{
    image=await pickImageUser(context);
    setState(() {
      
    });
  }

  void emailFocus() {
    isChecking?.change(emailFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }

   void passwordConfirmFocus() {
    isHandsUp?.change(birthFocusNode.hasFocus);
  }

   void nameFocus() {
    isChecking?.change(usernameFocusNode.hasFocus);
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
        
             
              //const SizedBox(height: 32),
              //TODO: letras de rive
              // Text( isdarkMode?
              //   "Que linda Contraseña":"A poco te llamas así!!!",
              //   style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.w800),
                
              //   // style: Theme.of(context).textTheme.headlineMedium,
                
              //   textAlign: TextAlign.center,
                
              // ),
              SizedBox(
                height: 150,
                width: 150,
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
                  color: Color.fromARGB(188, 4, 0, 0),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          selectedImage();
                        },child: image==null
                        ?const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.camera_alt_outlined,
                          size: 60,
                          color: Colors.white,),
                        )
                        :CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(image!),
                        )
                      ),
                      SizedBox(height: 10,),


                        CustomTextFormField(
                          icon: Icons.account_box,
                           colorTheme: colorTheme,
                            focusNode: usernameFocusNode,
                             controller: usernameController,
                             typeName: "Nombre de usuario",
                             labelText: "Ingrese su nombre de usuario",
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
                          labelText: "Ingrese su email",
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
                        labelText: "Ingrese su contraseña",
                        estado: false,
                        keyboardType:TextInputType.visiblePassword,
                        validator: Validators.passwordValidator, ),
                      // const SizedBox(height: 15),
                      //   CustomTextFormField(
                      //     icon: Icons.admin_panel_settings_rounded,
                      //      colorTheme: colorTheme,
                      //       focusNode: birthFocusNode,
                      //        controller: birthController,
                      //        typeName: "Password Confirm",
                      //        estado: true), 
                      const SizedBox(height: 15),

                      getBirth(context),
                      const SizedBox(height: 25),
                        SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text("Dont have have an account?"),
                            SizedBox(width: 5,),
                            GestureDetector(
                              onTap: widget.show,
                                child:  Text(
                                  "Login",
                                  style: TextStyle(color: Colors.blue),
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
                  
                  //     SizedBox(
                        
                  //       width: MediaQuery.of(context).size.width,
                  //       height: 64,
                  
                  //       child: ElevatedButton(                        
                  //         onPressed: () async {
                  //           nameFocusNode.unfocus();
                  //           emailFocusNode.unfocus();
                  //           passwordFocusNode.unfocus();
                  //           passwordConfirmFocusNode.unfocus();
                  //           final name=nameController.text;
                  //           final email = emailController.text;
                  //           final password = passwordController.text;
                  //           final passwordConfirm=passwordConfirmController.text;
                  //           if ( name.isEmpty || email.isEmpty || password.isEmpty || passwordConfirm.isEmpty ) {
                  //       // Muestra un mensaje de error al usuario si falta información
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           content: Text('Por favor, completa todos los campos.'),
                  //         ),
                  //       );
                  //       return;
                  //     }
                      
                  //       else{
                  //  showDialog(
                  //   context: context,
                  //   builder: (context) {
                  //     return Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         const Center(
                  //           // child: CircularProgressIndicator(),
                  //         ),
                  //         SizedBox(height: 10),
                  //         FutureBuilder(
                  //           future: Future.delayed(Duration(seconds: 2)),
                  //           builder: (context, snapshot) {
                  //             if (snapshot.connectionState == ConnectionState.done) {
                  //               return Column(
                  // children: [
                  //   const Center(
                  //     child: Icon(Icons.add_to_home_screen, size: 45),
                  //   ),
                  //   const Center(
                  //     child: Text("Presione para iniciar"),
                  //   ),
                  // ],
                  //               );
                  //             } else {
                  //               return CircularProgressIndicator();
                  //             }
                  //           },
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );
                  //       //  await AuthenticationRemote().register(email, password, passwordConfirm); 
                  
                  //       try{
                  //         if(password==passwordConfirm){
                  
                  //       var response = await AuthenticationRemoteUsers().register(name,email, password);
                  //       print(response);
                  //         // Navigator.pop(context);
                  //           if(response=="RegistradoExito"){
                      
                         
                  //        }else if(response=="[firebase_auth/email-already-in-use] The email address is already in use by another account."){
                  //           final String messagePassword="El usuario ya existe";
                  //         //  errorMessage(messagePassword);
                  //           ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: Color.fromARGB(255, 61, 92, 185),
                  //           content: Text(messagePassword),
                  //         ),
                  //       );
                  //       print("este es el contexto ${context}");
                  //         Navigator.pop(context);
                  //        }else if(response=="EmailIncorrecto"){
                  //           final String messageEmail="Email incorrecto";
                  //         //  errorMessage(messagePassword);
                  //           ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: Color.fromARGB(233, 255, 1, 1),
                  //           content: Text(messageEmail),
                  //         ),
                  //       );
                  //       print("este es el contexto ${context}");
                  //       // 
                  //         Navigator.pop(context);
                  //        }else if(response=="[firebase_auth/weak-password] Password should be at least 6 characters"){
                  //           final String messageEmail="La contraseña debe ser mayor a 6 caracteres";
                  //         //  errorMessage(messagePassword);
                  //           ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: Color.fromARGB(233, 255, 136, 1),
                  //           content: Text(messageEmail),
                  //         ),
                  //       );
                  //       print("este es el contexto ${context}");
                  //       // 
                  //         Navigator.pop(context);
                  //        }
                  //         }else{
                  //           print("las contraseñas no son iguales");
                  //            ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: Color.fromRGBO(255, 1, 1, 0.914),
                  //           content: Text("Las contraseñas no son iguales"),
                  //         ),
                  //       );
                  //           // errorMessage("Las contraseñas no son iguales");
                  //       print("este es el contexto ${context}");
                  
                  //       Navigator.pop(context);
                  
                  //         }
                  //       // await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
                  //       // Navigator.pop(context);
                  //        }on FirebaseAuthException catch (e){
                  //         Navigator.pop(context);
                  //         // errorMessage(e.code);
                      
                  //        }
                  //         // Navigator.pop(context);
                  
                  //     }
                  //         // Navigator.pop(context);
                  
                  //         },
                  //         style: ElevatedButton.styleFrom(
                            
                  //           backgroundColor: colorTheme.secondary,
                  //           shape: RoundedRectangleBorder(
                              
                  //             borderRadius: BorderRadius.circular(16), 
                              
                  //           ),
                            
                  //         ),
                  //         child:  Text("Register",style: TextStyle(fontSize: 18,color: colorTheme.background),),
                  //       ),
                  //     ),
                      const SizedBox(height: 10),
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
  Widget getBirth(BuildContext context){
        return CustomTextFormField(
          icon: Icons.calendar_today_outlined,
          colorTheme:Theme.of(context).colorScheme,
          focusNode: birthFocusNode,
          controller: birthController,
          readOnly:true,
          typeName: "dd/mm/yyyy",
          labelText: "Ingrese su fecha de nacimiento",
          estado: false,
          keyboardType:TextInputType.datetime,
          validator: Validators.birthValidator,
          onTap:()async{
            DateTime? pickedData=await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
               firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                builder:(context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: ColorScheme.light(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        surface: Colors.white,
                        onSurface: Colors.black
                      ),
                      dialogBackgroundColor: Colors.blue,
                      textButtonTheme: TextButtonThemeData(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.blue)
                        )
                      )
                    ),
                     child: child!);
                },
                );
                if(pickedData!=null){
                  final DateFormat formatter=DateFormat('dd/MM/yyyy');
                  String formatedData=formatter.format(pickedData);
                  setState(() {
                    birthController.text=formatedData;
                  });

                }
          },
        
          );
  }
}





// import 'package:cuteapp/presentation/screens/auth/mainpage.dart';
import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/presentation/screens/auth/mainpage.dart';
import 'package:cuteapp/presentation/widgets/CrearRecetas/createReceta_screen.dart';
import 'package:cuteapp/presentation/widgets/CrearRecetas/recetas_Screen.dart';
import 'package:cuteapp/presentation/widgets/DesidePorTi/decidePorti_screen.dart';
import 'package:cuteapp/presentation/widgets/anecdotasGraciosas/anecdotas_screen.dart';
import 'package:cuteapp/presentation/widgets/anecdotasGraciosas/shared/add_adnecdote.dart';
import 'package:cuteapp/presentation/widgets/anecdotasGraciosas/shared/edit_adnecdote.dart';
import 'package:cuteapp/presentation/widgets/busquedas/busqueda_Screen.dart';
import 'package:cuteapp/presentation/widgets/church/churchScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Adultos/adultosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Adultos/components/recursosadultos.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/screens/extrasScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/cunaScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/screens/leccionAlumnosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/screens/leccionMaestrosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/screens/materialesScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/screens/misioneroScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/screens/multimediaScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/shared/audioPlayViewExample.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/shared/audioplayViewScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/shared/pdfViewScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Infantes/components/recursosInfantes.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Infantes/infanteScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Intermedios/components/recursosIntermedios.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Intermedios/intermediariosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Juveniles/components/recursosJuveniles.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Juveniles/juvenilesScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Primarios/components/recursosPrimarios.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Primarios/primariosScreen.dart';
import 'package:cuteapp/presentation/widgets/crearImagenes/Image_Screen.dart';
import 'package:cuteapp/presentation/widgets/crearImagenes/crearImagen_Screen.dart';
import 'package:cuteapp/presentation/widgets/crearMusicas/Music_Screen.dart';
import 'package:cuteapp/presentation/widgets/crearMusicas/createMusic_screen.dart';
import 'package:cuteapp/presentation/widgets/momentosGraciosos/funnyMoment.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/screens/auth/registerScreen.dart';
import '../../presentation/screens/screen.dart';
import '../services/local_storage.dart';



part 'app_router.g.dart';
@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    // FIXME: NV 6.12.24
    // initialLocation: '/',
    initialLocation: (LocalStorage().getIsLoggedIn()) ? '/church' : '/',
  routes:[

      GoRoute(
      path: '/',
      // builder: (context, state) => const    ChurchScreen()),
      // builder: (context, state) => const    UserHome()),
      // TODO: Change to MainPageScreen
      // builder: (context, state) => const MainPageScreen()),
      builder: (context, state) => LoginScreen()),
      GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen()),

      // GoRoute(
      // path: '/login',
      // // builder: (context, state) => const    ChurchScreen()),
      // // builder: (context, state) => const    UserHome()),
      // // TODO: Change to MainPageScreen
      // builder: (context, state) => const MainPageScreen()),

      GoRoute(
      path: '/church',
      builder: (context, state) => const    ChurchScreen()),
        GoRoute(
      path: '/anecdotas',
      builder: (context, state) => const AnecdotasScreen()),

        GoRoute(
      path: '/editAnecdota',
      builder: (context, state) =>  EditAnecdote()),

     GoRoute(
      path: '/crearAnecdota',
      builder: (context, state) => const AddAnecdote()),
      // builder: (context, state) => const AnecdotasScreen()),
      // builder: (context, state) => const MainPageScreen()),
    
       GoRoute(
      
      path: '/createImage',
      builder: (context, state) => const CreateImageScreen()),

         GoRoute(
      
      path: '/createRecetas',
      builder: (context, state) => const CreateRecetaScreen()),


         GoRoute(
      
      path: '/createMusic',
      builder: (context, state) => const CreateMusicScreen()),

         GoRoute(
      
      path: '/decidePorti',
      builder: (context, state) => const DecidePorTiScreen() ),

    GoRoute(
      
      path: '/funnyMoment',
      builder: (context, state) => const FunnyMoment()),


       GoRoute(
      
      path: '/imageScreen',
      builder: (context, state) => const ImageScreen()),

       GoRoute(
      
      path: '/recetasScreen',
      builder: (context, state) => const RecetasScreen()),


       GoRoute(
      
      path: '/musicScreen',
      builder: (context, state) => const MusicScreen()),
      // builder: (context, state) => const MainPageScreen()),
      // builder: (context, state) => const AnecdotasScreen()),
      // builder: (context, state) => const HomeScreenAnimated()),
    // GoRoute(
    //   path: '/register',
    // builder: (context, state) => const RegisterScreen()),
      GoRoute(
      path: '/userProfile',
    builder: (context, state) =>  UserProfile()),

          GoRoute(
      path: '/userFavorite',
    builder: (context, state) =>  UserFavorite()),

          GoRoute(
      path: '/userSearch',
    builder: (context, state) => BusquedaScreen()),


          GoRoute(
      path: '/userSetting',
    builder: (context, state) =>  UserSettings()),


  //TODO: CHURCH
    //Church
       GoRoute(
      path: '/cuna',
    builder: (context, state) =>  CunaScreen()),

    GoRoute(
      path: '/infante',
    builder: (context, state) =>  InfanteScreen()),
    GoRoute(
      path: '/primarios',
    builder: (context, state) =>  PrimariosScreen()),

    GoRoute(
      path: '/intermediarios',
    builder: (context, state) =>  IntermediariosScreen()),

    GoRoute(
      path: '/juveniles',
    builder: (context, state) =>  JuvenilesScreen()),

    GoRoute(
      path: '/adultos',
    builder: (context, state) =>  AdultosScreen()),
    

    //recursos 
    GoRoute(
      path: '/leccion',
    builder: (context, state) =>  LeccionAlumnosScreenCuna()),
    //Cuna
     GoRoute(
      path: '/leccionMaestros',
    builder: (context, state) =>  LeccionMaestrosScreenCuna()),
     GoRoute(
      path: '/material',
    // builder: (context, state) =>  AudioPlayScreen()),
    // builder: (context, state) =>  AudioPlayViewScreen()),
    builder: (context, state) =>  MaterialScreenCuna()),
     GoRoute(
      path: '/multimedia',
    builder: (context, state) =>  MultimediaScreenCuna()),

     GoRoute(
        path: '/audio',
        builder: (context, state) {
          final content =state.extra as Content;
          return AudioPlayScreen(content: content);
        },
      ),
     GoRoute(
      path: '/misionero',
    builder: (context, state) =>  MisioneroScreenCuna()),
     GoRoute(
      path: '/extras',
    builder: (context, state) =>  ExtrasScreenCuna()),

       GoRoute(
        path: '/pdfviewer',
        builder: (context, state) {
          final content =state.extra as Content;
          return PdfViewerScreen(content: content);
        },
      ),
 
    //Cuna

     GoRoute(
      path: '/recursosInfantiles',
    builder: (context, state) =>  RecursosInfantiles()),


     GoRoute(
      path: '/recursosPrimarios',
    builder: (context, state) =>  RecursosPrimarios()),


    GoRoute(
      path: '/recursosIntermedios',
    builder: (context, state) =>  RecursosInternmedios()),

      GoRoute(
      path: '/recursosJuveniles',
    builder: (context, state) =>  RecursosJuveniles()),

       GoRoute(
      path: '/recursosAdultos',
    builder: (context, state) =>  RecursosAdultos()),
   
  ] 

);
}



  


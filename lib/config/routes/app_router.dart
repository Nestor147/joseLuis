
// import 'package:cuteapp/presentation/screens/auth/mainpage.dart';
import 'package:cuteapp/presentation/screens/auth/mainpage.dart';
import 'package:cuteapp/presentation/widgets/CrearRecetas/createReceta_screen.dart';
import 'package:cuteapp/presentation/widgets/CrearRecetas/recetas_Screen.dart';
import 'package:cuteapp/presentation/widgets/DesidePorTi/decidePorti_screen.dart';
import 'package:cuteapp/presentation/widgets/anecdotasGraciosas/anecdotas_screen.dart';
import 'package:cuteapp/presentation/widgets/anecdotasGraciosas/shared/CustomAnecdote.dart';
import 'package:cuteapp/presentation/widgets/anecdotasGraciosas/shared/add_adnecdote.dart';
import 'package:cuteapp/presentation/widgets/anecdotasGraciosas/shared/edit_adnecdote.dart';
import 'package:cuteapp/presentation/widgets/busquedas/busqueda_Screen.dart';
import 'package:cuteapp/presentation/widgets/crearImagenes/Image_Screen.dart';
import 'package:cuteapp/presentation/widgets/crearImagenes/crearImagen_Screen.dart';
import 'package:cuteapp/presentation/widgets/crearMusicas/Music_Screen.dart';
import 'package:cuteapp/presentation/widgets/crearMusicas/createMusic_screen.dart';
import 'package:cuteapp/presentation/widgets/momentosGraciosos/funnyMoment.dart';
import 'package:cuteapp/presentation/widgets/side_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/screens/screen.dart';



part 'app_router.g.dart';
@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
  routes:[

      GoRoute(
      path: '/',
      builder: (context, state) => const MainPageScreen()),
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

  
   
  ] 

);
}



  


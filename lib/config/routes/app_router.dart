
// import 'package:cuteapp/presentation/screens/auth/mainpage.dart';
import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/helpers/models/document.dart';
import 'package:cuteapp/config/services/local_storage.dart';

import 'package:cuteapp/presentation/screens/auth/registerScreen.dart';

import 'package:cuteapp/presentation/widgets/church/churchScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Adultos/adultosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Adultos/components/recursosadultos.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Adultos/screens/leccionAlumnosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Adultos/screens/leccionMaestrosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Adultos/screens/materialesScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Adultos/screens/multimediaAudiosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Adultos/screens/multimediaVideosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Adultos/shared/selectVideosOrAudiosScreenCuna.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/screens/multimediaVideosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/shared/selectVideosOrAudiosScreenCuna.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Infantes/screens/leccionAlumnosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Infantes/screens/leccionMaestrosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Infantes/screens/materialesScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Infantes/screens/misioneroScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Infantes/screens/multimediaAudiosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Infantes/screens/multimediaVideosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Infantes/shared/selectVideosOrAudiosScreenCuna.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Intermedios/screens/leccionAlumnosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Intermedios/screens/leccionMaestrosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Intermedios/screens/materialesScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Intermedios/screens/multimediaAudiosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Intermedios/screens/multimediaVideosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Intermedios/shared/selectVideosOrAudiosScreenCuna.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Juveniles/screens/leccionAlumnosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Juveniles/screens/leccionMaestrosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Juveniles/screens/materialesScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Juveniles/screens/multimediaAudiosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Juveniles/screens/multimediaVideosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Juveniles/shared/selectVideosOrAudiosScreenCuna.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Primarios/screens/leccionAlumnosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Primarios/screens/leccionMaestrosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Primarios/screens/materialesScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Primarios/screens/multimediaAudiosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Primarios/shared/selectVideosOrAudiosScreenPrimario.dart';
import 'package:cuteapp/presentation/widgets/church/screens/shared/extrasScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/cunaScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/screens/leccionAlumnosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/screens/leccionMaestrosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/screens/materialesScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/screens/misioneroScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Cuna/screens/multimediaAudiosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/shared/audioplayViewScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Infantes/components/recursosInfantes.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Infantes/infanteScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Intermedios/components/recursosIntermedios.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Intermedios/intermediariosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Juveniles/components/recursosJuveniles.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Juveniles/juvenilesScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Primarios/components/recursosPrimarios.dart';
import 'package:cuteapp/presentation/widgets/church/screens/Primarios/primariosScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/shared/pdfViewScreen.dart';
import 'package:cuteapp/presentation/widgets/church/screens/shared/videoPlayViewScreen.dart';



import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/screens/screen.dart';



part 'app_router.g.dart';
@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(

    initialLocation: (LocalStorage().getIsLoggedIn()) ? '/church' : '/',
  routes:[

      GoRoute(
      path: '/',

      // TODO: Change to MainPageScreen

      builder: (context, state) => LoginScreen()),
      GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen()),


      GoRoute(
      path: '/church',
      builder: (context, state) => const    ChurchScreen()),
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
    






 GoRoute(
      path: '/video',
      builder: (context, state) {
          final content =state.extra as Content;
          return VideoViewScreen(content: content);
        },),
    // builder: (context, state) =>  MultimediaScreenCuna()),

     GoRoute(
        path: '/audio',
        builder: (context, state) {
          final content =state.extra as Content;
          return AudioPlayScreen(content: content);
        },
      ),
         GoRoute(
        path: '/pdfviewer',
        builder: (context, state) {
          final content =state.extra as Content;
          return PdfViewerScreen(content: content);
        },
      ),
          GoRoute(
      path: '/extras',
    builder: (context, state) =>  ExtrasScreen()),



    //recursos 
    GoRoute(
      path: '/leccionCuna',
    builder: (context, state) =>  LeccionAlumnosScreenCuna()),
    //Cuna
     GoRoute(
      path: '/leccionMaestrosCuna',
    builder: (context, state) =>  LeccionMaestrosScreenCuna()),
     GoRoute(
      path: '/materialCuna',
    builder: (context, state) =>  MaterialScreenCuna()),
    
     GoRoute(
      path: '/misioneroCuna',
    builder: (context, state) =>  MisioneroScreenCuna()),
 
       GoRoute(
        path: '/multimediaCuna',
        builder: (context, state) => SelectVideosOrAudioScreenCuna()
      ),
        GoRoute(
          path: '/multimediaAudioCuna',
        builder: (context, state) => MultimediaAudiosScreenCuna()      
      ),
        GoRoute(    
        path: '/multimediVideoCuna',
        

        builder: (context, state) => MultimediaVideosScreenCuna()   
      ),
 
    //Cuna

     GoRoute(
      path: '/recursosInfantiles',
    builder: (context, state) =>  RecursosInfantiles()),
    GoRoute(
      path: '/leccionInfante',
    builder: (context, state) =>  LeccionAlumnosScreenInfante()),
    //Cuna
     GoRoute(
      path: '/leccionMaestrosInfante',
    builder: (context, state) =>  LeccionMaestrosScreenInfante()),
     GoRoute(
      path: '/materialInfante',
    builder: (context, state) =>  MaterialScreenInfante()),
    
     GoRoute(
      path: '/misioneroInfante',
    builder: (context, state) =>  MisioneroScreenInfante()),
 
       GoRoute(
        path: '/multimediaInfante',
        builder: (context, state) => SelectVideosOrAudioScreenInfante()
      ),
        GoRoute(
          path: '/multimediaAudioInfante',
        builder: (context, state) => MultimediaAudiosScreenInfante()      
      ),
        GoRoute(    
        path: '/multimediVideoInfante',
        

        builder: (context, state) => MultimediaVideosScreenInfante()   
      ),






    //infante


     GoRoute(
      path: '/recursosPrimarios',
    builder: (context, state) =>  RecursosPrimarios()),
 GoRoute(
      path: '/leccionPrimarios',
    builder: (context, state) =>  LeccionAlumnosScreenPrimarios()),
    //Cuna
     GoRoute(
      path: '/leccionMaestrosPrimarios',
    builder: (context, state) =>  LeccionMaestrosScreenPrimarios()),
     GoRoute(
      path: '/materialPrimarios',
    builder: (context, state) =>  MaterialScreenPrimarios()),
    
 
 
       GoRoute(
        path: '/multimediaPrimarios',
        builder: (context, state) => SelectVideosOrAudioScreenPrimarios()
      ),
        GoRoute(
          path: '/multimediaAudioPrimarios',
        builder: (context, state) => MultimediaAudiosScreenPrimarios()      
      ),
        GoRoute(    
        path: '/multimediVideoPrimarios',
        

        builder: (context, state) => MultimediaVideosScreenInfante()   
      ),

    //primarios
      GoRoute(
      path: '/recursosIntermediario',
    builder: (context, state) =>  RecursosInternmedios()),
 GoRoute(
      path: '/leccionIntermediario',
    builder: (context, state) =>  LeccionAlumnosScreenIntermedio()),
    //Cuna
     GoRoute(
      path: '/leccionMaestrosIntermediario',
    builder: (context, state) =>  LeccionMaestrosScreenIntermedio()),
     GoRoute(
      path: '/materialIntermediario',
    builder: (context, state) =>  MaterialScreenIntermedio()),
    
 
 
       GoRoute(
        path: '/multimediaIntermediario',
        builder: (context, state) => SelectVideosOrAudioScreenIntermedio()
      ),
        GoRoute(
          path: '/multimediaAudioIntermediario',
        builder: (context, state) => MultimediaAudiosScreenIntermedio()      
      ),
        GoRoute(    
        path: '/multimediVideoIntermediario',
        builder: (context, state) => MultimediaVideosScreenIntermedio()   
      ),




    //intermediarios

       GoRoute(
      path: '/recursosJuveniles',
    builder: (context, state) =>  RecursosJuveniles()),
 GoRoute(
      path: '/leccionJuveniles',
    builder: (context, state) =>  LeccionAlumnosScreenJuveniles()),
    //Cuna
     GoRoute(
      path: '/leccionMaestrosJuveniles',
    builder: (context, state) =>  LeccionMaestrosScreenJuveniles()),
     GoRoute(
      path: '/materialJuveniles',
    builder: (context, state) =>  MaterialScreenJuveniles()),
    
       GoRoute(
        path: '/multimediaJuveniles',
        builder: (context, state) => SelectVideosOrAudioScreenJuveniles()
      ),
        GoRoute(
          path: '/multimediaAudioJuveniles',
        builder: (context, state) => MultimediaAudiosScreenJuveniles()      
      ),
        GoRoute(    
        path: '/multimediVideoJuveniles',
        builder: (context, state) => MultimediaVideosScreenJuveniles()   
      ),

    
    //juveniles

     GoRoute(
      path: '/recursosAdultos',
    builder: (context, state) =>  RecursosAdultos()),
 GoRoute(
      path: '/leccionAdultos',
    builder: (context, state) =>  LeccionAlumnosScreenAdultos()),
    //Cuna
     GoRoute(
      path: '/leccionMaestrosAdultos',
    builder: (context, state) =>  LeccionMaestrosScreenAdultos()),
     GoRoute(
      path: '/materialAdultos',
    builder: (context, state) =>  MaterialScreenAdultos()),
    
       GoRoute(
        path: '/multimediaAdultos',
        builder: (context, state) => SelectVideosOrAudioScreenAdultos()
      ),
        GoRoute(
          path: '/multimediaAudioAdultos',
        builder: (context, state) => MultimediaAudiosScreenAdultos()      
      ),
        GoRoute(    
        path: '/multimediVideoAdultos',
        builder: (context, state) => MultimediaVideosScreenAdultos()   
      ),


    //Adultos 


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



  


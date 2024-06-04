import 'package:cuteapp/presentation/provider/UsuarioPersistente_provider.dart';
import 'package:cuteapp/presentation/provider/momentosGraciosos/funnyImage_provider.dart';
import 'package:cuteapp/presentation/provider/momentosGraciosos/imagenes_slider_provider.dart';
import 'package:cuteapp/presentation/provider/momentosGraciosos/images_slider_show_provider.dart';
import 'package:cuteapp/presentation/provider/movies/movies_providers.dart';
import 'package:cuteapp/presentation/widgets/anecdotasGraciosas/anecdotas_screen.dart';
import 'package:cuteapp/presentation/widgets/momentosGraciosos/funnyImage_slide_show.dart';
import 'package:cuteapp/presentation/widgets/shared/smart_device_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:google_fo';

class UserHome extends ConsumerStatefulWidget {
  const UserHome({super.key});

  @override
  UserHomeState createState() => UserHomeState();
}

class UserHomeState extends ConsumerState<UserHome> {
  final double horizontalPadding=40;
  final double verticalPadding=40;
  List mySmartDevices=[
       ["Recursos Adventistas",Icons.church_outlined ,true,'/church'],
       ["Foto del Día",Icons.add_a_photo,true,'/funnyMoment'],
    ["Anécdotas graciosas",Icons.add_reaction,true,'/anecdotas'],
    ["Crea Imagenes",Icons.image,true,'/imageScreen'],
    ["Crea Canciones",Icons.music_video,false,'/musicScreen'],
    ["Recetas de Comida",Icons.food_bank_outlined,true,'/recetasScreen'],
    ["Decide por tí",Icons.question_answer_outlined,true,'/decidePorti'],
    // ["Animate a Hablarle",Icons.speaker_notes,true,'/funnyMoment'],
    // ["Día Viernes",Icons.church,true,'/funnyMoment'],
 
  ];

  //power button switch
  void powerSwitchChanged(bool value, int index){
    setState(() {
      mySmartDevices[index][2]=value;
      ref.read(usuarioPersistenteProvider.notifier).loadUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
     body: SafeArea(
       child: Column(
        children: [
          //custom app bar
        
          const SizedBox(height: 30,),
          Column(
            children: [
              // Text("hola mundo")
            _SwiperFunnyMoments()

            ],
          ),

          const SizedBox(height: 20,),
         
          Expanded(
            child: GridView.builder(
              itemCount: mySmartDevices.length,
              padding: EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3
                ),
               
               itemBuilder:(context, index) {
                 return SmartDeviceBox(
                  smartDeviceName: mySmartDevices[index][0],
                   iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                  screenPath: mySmartDevices[index][3],
                    onChange: (value) {
                      powerSwitchChanged(value, index);    
                    },);
               },))
       ],),
     )
    );
  }
}



class _SwiperFunnyMoments extends ConsumerStatefulWidget {
  const _SwiperFunnyMoments({super.key});

  @override
  _SwiperFunnyMomentsState createState() => _SwiperFunnyMomentsState();
}

class _SwiperFunnyMomentsState extends ConsumerState<_SwiperFunnyMoments> {
  @override
  void initState() {
    super.initState();
    // ref.read(nowplayingMoviesProvider.notifier).loadNextPage();
    ref.read(imagnesSliderProvider.notifier).getImages();
    // ref.read(nowplayingfunnyImageProvider.notifier).loadNextPage();
  }
   

  @override
  Widget build(BuildContext context) {
    final nowplayingImages=ref.watch(imagnesSliderProvider);
    // final nowplayingFunnyImage=ref.watch(nowplayingfunnyImageProvider);
    return Column(
      children: [
        FunnyImageSlideShow(funnyImageList: nowplayingImages)
      ],
    );
  }
}


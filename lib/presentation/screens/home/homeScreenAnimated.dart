import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cuteapp/presentation/provider/UsuarioPersistente_provider.dart';
import 'package:cuteapp/presentation/provider/movies/movies_providers.dart';
import 'package:cuteapp/presentation/provider/movies/movies_slide_show_provider.dart';
import 'package:cuteapp/presentation/screens/screen.dart';
import 'package:cuteapp/presentation/widgets/busquedas/busqueda_Screen.dart';
import 'package:cuteapp/presentation/widgets/momentosGraciosos/funnyImage_slide_show.dart';
import 'package:cuteapp/presentation/widgets/side_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class HomeScreenAnimated extends ConsumerStatefulWidget {
  const HomeScreenAnimated({super.key});

  @override
  HomeScreenAnimatedState createState() => HomeScreenAnimatedState();
}

class HomeScreenAnimatedState extends ConsumerState<HomeScreenAnimated> {
  final navigationKey=GlobalKey<CurvedNavigationBarState>();
    int indexInitial=2;
    final screens=[
      UserProfile(),
      UserFavorite(),
      UserHome(),
      BusquedaScreen(),
      UserSettings()
    ];
  final user =FirebaseAuth.instance.currentUser!;
  
  void signUserOut(){
    FirebaseAuth.instance.signOut();
    ref.read(usuarioPersistenteProvider.notifier).clearUserData();
  }
  

  

  @override
  Widget build(BuildContext context) {
    final scaffoldkey=GlobalKey<ScaffoldState>();
    final colorTheme=Theme.of(context).colorScheme;

    final items=[
      Icon(Icons.person,size: 30,),
      Icon(Icons.favorite,size: 30,),
      Icon(Icons.home,size: 30,),
      Icon(Icons.search,size: 30,),
      Icon(Icons.settings,size: 30,),
    ];
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("CuteApp") , actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
      ),
      backgroundColor: colorTheme.primary,
      body: screens[indexInitial],
      drawer:SideMenu(scaffolkey: scaffoldkey,) ,
  
      
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: colorTheme.primary)
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          
          // color: Colors.blue,
          animationCurve: Curves.easeInOut,
          backgroundColor: Colors.transparent,
          // height: 60,
          index: indexInitial,   
          items: items,
          onTap: (index)=>setState(() {
            indexInitial=index;
            ref.read(usuarioPersistenteProvider.notifier).loadUserData();
          }
        ),
          
        ),
      ),
    );
  }
}


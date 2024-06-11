import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
  
   
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(padding: const EdgeInsets.all(8.0),
          child: Stack(alignment: Alignment.center,
          children: [
            Container(
              child:Image.asset('assets/fondoUAB.jpg',fit: BoxFit.cover,),
              decoration: BoxDecoration(
                color: Colors.amber,borderRadius: BorderRadius.circular(20),
              ),
              height: 150,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              padding: const EdgeInsets.only(top: 100),
              child: CircleAvatar(backgroundColor: Colors.white,
              radius: 55,
              child: CircleAvatar(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 50,left: 80),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 10,
                        child: Center(
                          child: Icon(color: Colors.black,
                          Icons.edit,
                          size: 12,),
                        ),
                      ),
                    )
                  ],
                ),
                backgroundImage: const AssetImage('assets/5.jpg',),
                radius: 50,
              ),
              ),
            )
          ],
          ),
          
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Usuario",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                   Padding(
            padding: EdgeInsets.all(5.0),
            child: Text("547",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
          ),
                  
                  Text("Mis Vistas",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18))
                ],),

                  Column(children: [
                            Padding(
            padding: EdgeInsets.all(5.0),
            child: Text("750",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
          ),
                    
                  
                  Text("Likes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18))
                ],),
                  Column(children: [

                                    Padding(
            padding: EdgeInsets.all(5.0),
            child:  Text("45",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
          ),
                 
                  Text("Búsquedas",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18))
                ],)
              ],
            ),
          ),
        Padding(padding: EdgeInsets.all(8.0),
        child: Container(
          height: 300,width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              ListTile(
                title: Text("Nombre",style: TextStyle(color: Colors.grey,fontSize: 14),),
                
                subtitle: Text("NesDevs",style: TextStyle(color: Colors.white,fontSize: 14)),
                // subtitle: Text("${ref.watch(usuarioPersistenteProvider).name}",style: TextStyle(color: Colors.white,fontSize: 14)),
              ),
              Divider(color: Colors.grey,),
               ListTile(
                title: Text("Correo",style: TextStyle(color: Colors.grey,fontSize: 14),),
                
                subtitle: Text("nestorvillca147@gmail.com",style: TextStyle(color: Colors.white,fontSize: 14)),
                // subtitle: Text("${ref.watch(usuarioPersistenteProvider).email}",style: TextStyle(color: Colors.white,fontSize: 14)),
              ),
              Divider(color: Colors.grey,),
               ListTile(
                title: Text("Rol",style: TextStyle(color: Colors.grey,fontSize: 14),),
                
                subtitle: Text("Estudiante",style: TextStyle(color: Colors.white,fontSize: 14)),
                // subtitle: Text("${ref.watch(usuarioPersistenteProvider).role}",style: TextStyle(color: Colors.white,fontSize: 14)),
              ),
              Divider(color: Colors.grey,),
              

            ],
          ),
        ),)
        
        ]),
      ),
      
      

    );
  }
}




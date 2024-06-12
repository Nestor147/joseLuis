import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasicCard extends StatefulWidget {
  final String imageURL;
  final String title;
  final String age;
  final String screenPath;

  const BasicCard({super.key, required this.imageURL, required this.title, required this.screenPath, required this.age});

  @override
  State<BasicCard> createState() => _BasicCardState();
}

class _BasicCardState extends State<BasicCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push(widget.screenPath);
      },
      // onTap: (){ context.pushReplacementNamed(widget.screenPath); },
      child: Column(
        children: [
          Container(
        width: double.infinity,
        height: 150,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40), // Top-left radius
            topRight: Radius.circular(5), // Top-right radius
            bottomLeft: Radius.circular(0), // Bottom-left radius
            bottomRight: Radius.circular(50), // Bottom-right radius
          ),
          image: DecorationImage(
            image: AssetImage(widget.imageURL),
            fit: BoxFit.cover,
            opacity: 00.4
          ),
          gradient: const LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(31, 80, 62, 62), Color.fromARGB(206, 77, 53, 53)],
          ),
        ),
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.5, 10, 5),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: const CircleAvatar(   
                 backgroundImage: AssetImage("assets/logoIglesia.jpg"),
        ) ,
                title: Text(widget.title,style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 11, 35, 86),fontSize:25)),
                subtitle: Text(widget.age,style: const TextStyle(fontWeight: FontWeight.bold ,color: Color.fromARGB(255, 11, 35, 86),fontSize:20,fontFamily:AutofillHints.streetAddressLevel1)),
                trailing: const Icon(Icons.church,size: 40,color: Color.fromARGB(255, 11, 35, 86),),
      
              )
            ],
          ),
        ),
      ),
      const SizedBox(height: 20,)
        ],
      ),
    );
      
    
  }
}
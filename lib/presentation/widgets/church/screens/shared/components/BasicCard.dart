import 'package:cuteapp/config/themes/appTheme.dart';
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
        height: 100,
        decoration:  BoxDecoration(
          color: colorSDATheme,
          borderRadius: BorderRadius.circular(20)
         
        ),
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.5, 10, 5),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
         
                title: Text(widget.title,style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize:18)),
                trailing: const Icon(Icons.arrow_forward,size: 20,color: Colors.white,),
      
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
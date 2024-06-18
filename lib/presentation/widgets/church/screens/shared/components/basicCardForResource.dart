import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardForResource extends StatefulWidget {
  final String imageURL;
  final String title;
  final String subtitle;
  final String screenPath;
  final Icon iconData;

  const CardForResource({
    super.key,
    required this.imageURL,
    required this.title,
    required this.screenPath,
    required this.subtitle,
    required this.iconData
  });

  @override
  State<CardForResource> createState() => _CardForResourceState();
}

class _CardForResourceState extends State<CardForResource> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 8, 5, 5),
      child: GestureDetector(
        onTap: () {
          context.push(widget.screenPath);
        },
        child: Container(
      
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorSDATheme),
          height: 100,
          // width: double.infinity,
      
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          // Permite que los hijos se salgan del Stack
            children: [
          
             
              Container(
                  width: 130,
          
                  decoration: BoxDecoration(
                
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
            Container(
                  width: 130,
                 
                  decoration: BoxDecoration(
                
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      widget.subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
           

            ],
          ),
        ),
      ),
    );
  }
}

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
          // width: double.infinity,
          height: 350,
          child: Stack(
            clipBehavior: Clip.none, // Permite que los hijos se salgan del Stack
            children: [
              Container(  
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.imageURL),
                    fit: BoxFit.cover,
                    opacity: 0.22,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(31, 80, 62, 62),
                      Color.fromARGB(206, 77, 53, 53)
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -20,
                left: 55,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: widget.iconData,
                  ),
                ),
              ),
              Positioned(
                top: 75,
                left: 19,
                child: Container(
                  width: 130,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 140,   
                left: 19,
                child: Container(
                  width: 130,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(0, 0, 0, 0),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      widget.subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                      ),
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

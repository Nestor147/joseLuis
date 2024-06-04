import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final IconData iconPath;
  final bool powerOn;
  void Function(bool)? onChange;
  final String screenPath;

   SmartDeviceBox({super.key, 
  required this.smartDeviceName,
   required this.iconPath,
    required this.powerOn,
    required this.onChange, required this.screenPath});

  @override
  Widget build(BuildContext context) {
    final colorTheme=Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: GestureDetector(
        onTap:(){ context.push(screenPath);},
        child: Container(
         
          decoration: BoxDecoration(
            color: powerOn ? colorTheme.primary : Colors.grey[200],
          borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Column(children: [
              Icon(iconPath,
              size: 50,
                  color: powerOn ? Colors.white : Colors.black
              ),
          
              //smart device name + swith
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: 
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child:  Text(smartDeviceName,style: GoogleFonts.bebasNeue( fontWeight: 
                                    FontWeight.bold, fontSize: 22,
                                    color: powerOn ? Colors.white : Colors.black
                                    ),),
                      )),
                    Transform.rotate(
                      angle: pi / 2 ,
                      child: CupertinoSwitch(value: powerOn,
                       onChanged:onChange),
                    )
                  ],
                ),
              )
              
            ]),
          ),
        ),
      ),
    );
  }
}
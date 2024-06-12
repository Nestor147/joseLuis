import 'package:flutter/material.dart';

const List<Color> themesColor=[
  Colors.orange,
  // Colors.black,
  Colors.green,
  Color.fromARGB(255, 11, 140, 232),
  Colors.brown,
  Colors.pinkAccent,
  Colors.teal,
  Colors.red,
  Colors.yellow,
  Colors.greenAccent,
  Colors.deepOrange
];

const colorTheme =Color.fromARGB(255, 11, 140, 232);
const colorSDATheme = Color.fromRGBO(0, 127, 152, 1.0);
class AppthemeNew{
  final int selectedColor ;
  final bool isDarkMode ;

  AppthemeNew({ this.selectedColor=0,this.isDarkMode=false}):assert(selectedColor>=0,'selected color must be greater then 0');
  ThemeData getTheme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed:themesColor[selectedColor],
      brightness:isDarkMode ? Brightness.dark :Brightness.light

    );
  }
   AppthemeNew copyWhite({
    int? selectedColor,
  bool? selectedModeIsDark
  }){
  

    return AppthemeNew(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: selectedModeIsDark ?? this.isDarkMode);

  }
}
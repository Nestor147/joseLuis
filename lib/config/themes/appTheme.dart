import 'package:flutter/material.dart';

const List<Color> themesColor=[
  Colors.black,

];

const colorSDATheme = Color.fromRGBO(0, 0, 0, 1);
const colorFondo = Color.fromRGBO(252, 248, 3, 1);
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
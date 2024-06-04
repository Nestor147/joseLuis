import 'package:flutter/material.dart';

class ScrollControllerMove{


  final ScrollController scrollController=ScrollController();


    Future<void> moveScrollController()async{
    Future.delayed(Duration(milliseconds: 150));
   scrollController.animateTo(
      scrollController.position.maxScrollExtent,
     duration: Duration(milliseconds: 300),
      curve: Curves.easeOut);
  }

}
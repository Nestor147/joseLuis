import 'package:flutter/material.dart';
class CustomTextFieldDouble extends StatelessWidget {
  const CustomTextFieldDouble({
    super.key,
    required this.colorTheme,
    required this.focusNode,
    required this.controller,
    required this.typeName,
     required this.numberOfLines
  });
  final int numberOfLines;
  final ColorScheme colorTheme;
  final FocusNode focusNode;
  final TextEditingController controller;
  final String typeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorTheme.background,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: TextField(
        maxLines: numberOfLines,
        focusNode: focusNode,
        controller: controller,
        decoration:  InputDecoration(

          border: InputBorder.none,
          hintText: typeName,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xffc5c5c5),
              width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color:Colors.blue,
              width: 2.0),
            )
        
        ),
        style: Theme.of(context).textTheme.bodyMedium,
       
      ),
    );
  }
}

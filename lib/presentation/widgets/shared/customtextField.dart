import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {


  final ColorScheme colorTheme;
  final FocusNode focusNode;
  final TextEditingController controller;
  final String typeName;
  final IconData icon;
  final bool estado;
  final TextInputType inputType;

  const CustomTextField({super.key, required this.colorTheme, required this.focusNode, required this.controller, required this.typeName, required this.icon, required this.estado, required this.inputType});

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
        obscureText: estado,
        focusNode: focusNode,
        controller: controller,
        maxLines: 1,
       keyboardType: inputType,  
        decoration:  InputDecoration(
        border: InputBorder.none,
        hintText: typeName,
        prefixIcon:  Icon(icon, color: focusNode.hasFocus ? Colors.blue :const Color(0xffc5c5c5),),
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

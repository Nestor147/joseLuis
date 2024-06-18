import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:cuteapp/config/validators/validator.dart';
import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {


  final ColorScheme colorTheme;
  final FocusNode focusNode;
  final TextEditingController controller;
  final String typeName;
  final IconData icon;
  final bool estado;
  final TextInputType keyboardType;
  final String labelText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final String? Function(String?) validator;

  const CustomTextFormField({super.key, required this.colorTheme, required this.focusNode, required this.controller, required this.typeName, required this.icon, required this.estado, required this.keyboardType, required this.validator, required this.labelText, this.onTap, this.readOnly});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorTheme.background,
        borderRadius: BorderRadius.circular(1),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: TextFormField(
        obscureText: estado,
        focusNode: focusNode,
        controller: controller,
        validator: validator,
        onTap: onTap,
        maxLines: 1,
       keyboardType: keyboardType,  
        decoration:  InputDecoration(
        border: InputBorder.none,
        hintText: typeName,
        labelText: labelText,
        prefixIcon:  Icon(icon, 
          color: focusNode.hasFocus ? 
            // FIXME: FM 6.11.24
            // Colors.blue :
            colorSDATheme :
            const Color(0xffc5c5c5),),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
              width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: const BorderSide(
                // FIXME: FM 6.11.24
                // color:Colors.blue,
                color:colorSDATheme,
                width: 2.0
              ),
            )
        
        ),
        style: Theme.of(context).textTheme.bodyMedium,
       
      ),
    );
  }
}

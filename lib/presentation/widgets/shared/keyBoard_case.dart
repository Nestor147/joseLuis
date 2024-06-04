import 'package:flutter/material.dart';

class KeyBoardCase extends StatelessWidget {
 final String text;
 final Color colorInput;
  final ValueChanged onChange;

  const KeyBoardCase({super.key, required this.text, required this.colorInput, required this.onChange});


  @override
  Widget build(BuildContext context) {
    final colorTheme=Theme.of(context).colorScheme;
    final focusNode=FocusNode();
    final textController=TextEditingController();
  
    
    final outlineInputBorder=UnderlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Color.fromARGB(0, 255, 255, 255),)
    );
    final inputDecoration=InputDecoration(
      labelStyle: TextStyle(color: Colors.black),
      
      enabledBorder: outlineInputBorder,
      fillColor:colorInput,
      hoverColor: Colors.green,
      

      focusedBorder: outlineInputBorder,
      suffixIcon: IconButton(icon: const Icon(Icons.send_outlined,color:Colors.white,),onPressed: (){
        final textValue=textController.value.text;
        onChange(textValue);
        textController.clear();
  
      },),
      filled: true,
      hintText: text
    );
    return TextFormField(
      
      controller: textController,
      focusNode: focusNode,
      decoration:inputDecoration ,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        print(value);
        textController.clear();
        onChange(value);
        focusNode.requestFocus();

      },
    );
  }
}
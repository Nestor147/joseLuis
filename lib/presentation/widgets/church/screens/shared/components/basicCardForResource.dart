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
    return Column(
      children: [
        SizedBox(height: 15,),
        ListTile(
      tileColor: colorSDATheme,
      onTap: (){context.push(widget.screenPath);},
      title: Text(widget.title,style: TextStyle(color: Colors.white,),),
      subtitle: Text(widget.subtitle,style: TextStyle(color: Colors.white,),),
      leading: Icon(Icons.document_scanner,color: Colors.white,),

    ),
        SizedBox(height: 15,),

      ],
    );
  }
}



import 'package:cuteapp/domain/entities/momentosGraciosos/imageFunnyMoment.dart';
import 'package:cuteapp/domain/entities/movie.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';


class FunnyImageSlideShow extends StatelessWidget {
  final List<ImageFunnyMoment> funnyImageList;
  const FunnyImageSlideShow({super.key, required this.funnyImageList});

  @override
  Widget build(BuildContext context) {
    final color=Theme.of(context).colorScheme;
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        pagination: SwiperPagination(
          margin:const EdgeInsets.only(top:0),
          builder:DotSwiperPaginationBuilder(
            activeColor: color.primary,
            color: color.secondary)),
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemCount:funnyImageList.length,
        itemBuilder: (context, index) {
          ImageFunnyMoment funnyImage = funnyImageList[index];
          return _Slider(funnyImage: funnyImage,);
        },)
    );
    
  }
}

class _Slider extends StatelessWidget {
  final ImageFunnyMoment funnyImage;
  const _Slider({required this.funnyImage});

  @override
  Widget build(BuildContext context) {
    final decoration=BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
         BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0,10)

        )
        
      ]
    );
    return Padding(padding:const EdgeInsets.only(bottom: 30),
    child: DecoratedBox(
      decoration: decoration,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
    child: Image.network(funnyImage.imageUrl,
    fit: BoxFit.cover,
    loadingBuilder: (context, child, loadingProgress) {
      if(loadingProgress != null){
        return const DecoratedBox(decoration: BoxDecoration(color: Colors.black12),);
      } 
      return FadeIn(child: child);
    }
    ,),),
    ),);
  }
}
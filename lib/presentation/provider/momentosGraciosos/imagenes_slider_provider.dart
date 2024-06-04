

import 'package:cuteapp/domain/entities/momentosGraciosos/imageFunnyMoment.dart';
import 'package:cuteapp/infraestructure/datasources/momentosGraciosos/funnyMoment_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'imagenes_slider_provider.g.dart';

@riverpod
class ImagnesSlider extends _$ImagnesSlider {
  @override
   List<ImageFunnyMoment> build() {
    final List<ImageFunnyMoment> listaImagenes=[];
    return listaImagenes;
  }

  void getImages() async{
    final response=await FunnyMomentDataSourceImpl().getFunnyImage();
    state=[...state,...response];
    

    
  }
  void setData(){
    state=[];
  }
}
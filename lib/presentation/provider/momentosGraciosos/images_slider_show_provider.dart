import 'package:cuteapp/domain/entities/momentosGraciosos/imageFunnyMoment.dart';
import 'package:cuteapp/presentation/provider/momentosGraciosos/funnyImage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imagesSlideShowProvider=Provider<List<ImageFunnyMoment>>((ref)  {
  final nowplayingImages=ref.watch(nowplayingfunnyImageProvider);
  if(nowplayingImages.isEmpty) return [];
  return nowplayingImages.sublist(0,6);
});
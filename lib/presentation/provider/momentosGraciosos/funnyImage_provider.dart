import 'package:cuteapp/domain/entities/momentosGraciosos/imageFunnyMoment.dart';
import 'package:cuteapp/presentation/provider/momentosGraciosos/funnyImag_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final nowplayingfunnyImageProvider=StateNotifierProvider<FunnyImageNotifier,List<ImageFunnyMoment>>((ref) {
  final fetchMoreFunnyImage=ref.watch(funnyImageRepositoriesProvider).getFunnyImage;
   return FunnyImageNotifier(fetchMoreFunnyImage: fetchMoreFunnyImage); });

typedef FunnyImageCallBack=Future<List<ImageFunnyMoment>> Function();

class FunnyImageNotifier extends StateNotifier<List<ImageFunnyMoment>>{
    final FunnyImageCallBack fetchMoreFunnyImage;

  FunnyImageNotifier({required this.fetchMoreFunnyImage}):super([]);

  // int currentpage=0;
  bool isloading=false;

  Future<void> loadNextPage()async{
    if(isloading) return;
    isloading=true;
    // currentpage++;
    final List<ImageFunnyMoment> funnyImage=await fetchMoreFunnyImage();
    state=[...state, ...funnyImage];
    isloading=false;
  }
} 
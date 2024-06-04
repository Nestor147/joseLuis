

import 'package:cuteapp/domain/datasource/momentosGraciosos/funnyMoment_datasource.dart';
import 'package:cuteapp/domain/entities/momentosGraciosos/imageFunnyMoment.dart';
import 'package:cuteapp/domain/repositories/momentosGraciosos/selectImage_repositories.dart';

class FunnyImageRepositoryImpl extends FunnyImageRepositories{


  final FunnyMomentDatasource datasource;

  FunnyImageRepositoryImpl(this.datasource);

  @override
  Future<List<ImageFunnyMoment>> getFunnyImage() {
    return datasource.getFunnyImage();
  }

 




}
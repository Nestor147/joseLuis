import 'package:cuteapp/domain/entities/momentosGraciosos/imageFunnyMoment.dart';
import 'package:image_picker/image_picker.dart';

abstract class FunnyImageRepositories{
  Future<List<ImageFunnyMoment>> getFunnyImage();
}
import 'package:cuteapp/domain/entities/momentosGraciosos/imageFunnyMoment.dart';
import 'package:flutter/material.dart';

abstract class FunnyMomentDatasource{
  Future<List<ImageFunnyMoment>> getFunnyImage(); 
}
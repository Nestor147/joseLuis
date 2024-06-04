

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stadoDeCreacion_provider.g.dart';

@riverpod
class StadoDeCreacion extends _$StadoDeCreacion {
  @override
   bool build() {
    return false;
  }
  void setState(){
    state = !state;
  }
}
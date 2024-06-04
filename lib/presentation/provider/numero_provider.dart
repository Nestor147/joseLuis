
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'numero_provider.g.dart';

@Riverpod(keepAlive: true)
class NumeroProvider extends _$NumeroProvider {
  @override
   int build() {
    return 5;
  }
  void updateAnecdota(int idAnecdota){
    state=idAnecdota;
  }
}
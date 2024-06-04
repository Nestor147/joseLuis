

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'numeroentero_provider.g.dart';

@riverpod
class NumeroEntero extends _$NumeroEntero {
  @override
   int build() {
    return 5;
  }
}
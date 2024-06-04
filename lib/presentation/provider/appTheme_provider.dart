

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'appTheme_provider.g.dart';

@riverpod
class AppThemeGlobal extends _$AppThemeGlobal {
  @override
  bool build() {
    return true ;
  }
  void setTheme(){
    state = !state;
  }
}
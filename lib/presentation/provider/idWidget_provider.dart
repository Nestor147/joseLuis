

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'idWidget_provider.g.dart';
@Riverpod(keepAlive: true)
class IdWidget extends _$IdWidget {
  @override
  String build() {
    return  "";
  }
  void setIdWidget(String id){
    state=id;
  }
}
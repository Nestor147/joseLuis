
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cuteapp/domain/entities/entities.dart';
part 'customUser_provider.g.dart';

@Riverpod(keepAlive: true)
class CustomUser extends _$CustomUser {
  @override
   CustomUserAuthentication build() {
    return CustomUserAuthentication(userId: "0", name: "Sin nombre", email: "Sin email", role: "Sin role");
  }
   void setUser(String id,String name,String email,String role){
    
    state=CustomUserAuthentication(userId: id, name: name, email: email, role: role);
   }
}
 

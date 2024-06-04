import 'package:cuteapp/domain/entities/customUser.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';



class CustomUserNotifier extends StateNotifier<CustomUserAuthentication> {
  CustomUserNotifier() : super(CustomUserAuthentication(userId: "0", name: "Sin nombre", email: "Sin email", role: "Sin role"));

  Future<void> saveUserData(String userId, String name, String email, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('role', role);
    state = CustomUserAuthentication(userId: userId, name: name, email: email, role: role);
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId') ?? "no hay id";
    final name = prefs.getString('name') ?? "Sin nombre";
    final email = prefs.getString('email') ?? "Sin email -------";
    final role = prefs.getString('role') ?? "Sin role";
    state = CustomUserAuthentication(userId: userId, name: name, email: email, role: role);
  }

  // Eliminar los datos del usuario al salir de la aplicación o cerrar la sesión
Future<void> clearUserData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
}

final usuarioPersistenteProvider = StateNotifierProvider<CustomUserNotifier, CustomUserAuthentication>((ref) => CustomUserNotifier());
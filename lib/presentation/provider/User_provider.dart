import 'package:shared_preferences/shared_preferences.dart';

// Guardar los datos del usuario
class AlmacenarUsuario{
  Future<void> saveUserData(String id, String name, String email, String role) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('id', id);
  await prefs.setString('name', name);
  await prefs.setString('email', email);
  await prefs.setString('role', role);
}

// Cargar los datos del usuario
Future<Map<String, String>> loadUserData() async {
  final prefs = await SharedPreferences.getInstance();
  return {
    'id': prefs.getString('id') ?? "0",
    'name': prefs.getString('name') ?? "Sin nombre",
    'email': prefs.getString('email') ?? "Sin email",
    'role': prefs.getString('role') ?? "Sin role",
  };
}
}
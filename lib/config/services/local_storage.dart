import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalStorage{
  static final LocalStorage _instance=LocalStorage._internal();

  factory LocalStorage(){
    return _instance;
  }
  LocalStorage._internal();

  late Box _userBox;

  Future<void> init()async{
    // Initializar Hive 
    final appDocumentDirectory=await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    //Abrir la caja (Box) para almacenar datos de usuario
    _userBox=await Hive.openBox('userBox');
  }

  //limpiar la caja
  Future<void> clear() async{
    await _userBox.clear();
  }

  Future<void> saveUserData(String usernameOrEmail, String password)async{
    await _userBox.put('usernameOrEmail', usernameOrEmail);
    await _userBox.put('password', password);
  }

  //getUserData

  Future<dynamic> getUserData(String usernameOrEmail) async{
    //ObTENER DATOS DE USUARIO DE LA CAJA
    final String password=_userBox.get('password',defaultValue: '') as String;

    //Devolver datos de usuario
    return {
      'usernameOrEmail':usernameOrEmail,
      'password':password
    };
  }

  String getEmailOrUsername(){
    return _userBox.get('usernameOrEmail', defaultValue: '') as String;
  }

  String getPassword(){
    //Obtener datos de usuario de la caja
    return _userBox.get('password', defaultValue: '') as String;
  }

  Future<void> setIsSignedIn(bool isSignedIn) async{
    // Guardar estado de inicio de secion en la caja
    await _userBox.put('is_signedin', isSignedIn);
  }

  bool getIsSignedIn(){
    //obtener estado de inicio de sesión de la caja
    return _userBox.get('is_signedin',defaultValue: false) as bool;
  }
  Future<void> deleteIsSignedIn() async{
    //eliminar la clave de 'is_signedin' de la caja
    await _userBox.delete('is_signedin');
  }

  Future<void> setIsLoggedIn(bool isLoggedIn)async{
    //guardar el valor de 'isLoggedIn' en la caja
    await _userBox.put('isLoggedIn', isLoggedIn);
  }

  bool getIsLoggedIn(){
    //obtener el valor de 'isLoggedIn' de la caja
    return _userBox.get('isLoggedIn',defaultValue: false) as bool;
  }

  Future<bool> getIsFirstTime()async{
    //obtener el valor de 'isFirsrTime' de la caja
    final bool isFirstTime=_userBox.get('isFirstTime',defaultValue: true) as bool;

    if(isFirstTime){
      await _userBox.put('isFirstTime', false);
      return true;
    }

    // si no es la primera vez, devuelve false
    return false;
  }
  Future<void> savePageIndex(int index)async{
    await _userBox.put('pageIndex', index);
  }

  int getPageIndex(){
    return _userBox.get('pageIndex',defaultValue: 0) as int;
  }
}

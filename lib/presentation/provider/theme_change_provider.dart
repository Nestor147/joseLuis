import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final themeChangeProvider=Provider((ref) => themesColor);
final selectedThemeProvider=StateProvider<int>((ref) => 5);

final isdarkModeProvider=StateProvider<bool>((ref) => true);


final themeNotifierProvider=StateNotifierProvider<ThemeNotifier,AppthemeNew>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppthemeNew>{
  ThemeNotifier():super(AppthemeNew());
  void toggleDrakMode(){
    state=state.copyWhite(selectedModeIsDark: !state.isDarkMode);
  }
  changeTheme(int index){
    state=state.copyWhite(selectedColor:index );
  }


}
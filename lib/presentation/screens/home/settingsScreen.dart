import 'package:cuteapp/presentation/provider/theme_change_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class UserSettings extends ConsumerStatefulWidget {
  const UserSettings({super.key});

  @override
  UserSettingsState createState() => UserSettingsState();
}

class UserSettingsState extends ConsumerState<UserSettings> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode=ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(title: Text('Elige el color de tu aplicación'),
      actions: [IconButton(onPressed: (){

        ref.read(themeNotifierProvider.notifier).toggleDrakMode();
        
      }, icon: isDarkMode ?Icon(Icons.light_mode_outlined) : Icon(Icons.dark_mode_outlined))],),
      body: _ThemeChangerView(),
    );
  }
}



class _ThemeChangerView extends ConsumerWidget {

  @override
  Widget build(BuildContext context,ref) {
    final themesChanger=ref.watch(themeChangeProvider);
    // final selectedTheme=ref.watch(selectedThemeProvider);
    final selectedTheme=ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: themesChanger.length,
      itemBuilder:(context, index) {
      final color=themesChanger[index];
      return RadioListTile(
        title: Text("Este color es",style: TextStyle(color: color),),
        subtitle: Text("${color.value}"),
        activeColor: color,
        value: index, 
        groupValue:selectedTheme,
         onChanged:(value) {
          value=ref.read(themeNotifierProvider.notifier).changeTheme(index);
          print(value);
          
         },);
    },);
  }
}
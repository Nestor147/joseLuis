import 'package:cuteapp/config/routes/app_router.dart';
import 'package:cuteapp/config/services/local_storage.dart';
import 'package:cuteapp/config/services/push_notification.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:cuteapp/presentation/provider/appTheme_provider.dart';
import 'package:cuteapp/presentation/provider/theme_change_provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';




Future<void> main() async {
  Intl.defaultLocale='es_ES';
  await initializeDateFormatting();
 // WidgetsFlutterBinding.ensureInitialized();
 // MainModule.init();
 // WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
 WidgetsFlutterBinding.ensureInitialized();
 await PushNotificationService.initializeApp();
 await LocalStorage().init();
 final isLogged=LocalStorage().getIsLoggedIn();
  runApp( ProviderScope(child: MyApp(isLogged:isLogged)));
}

class MyApp extends ConsumerWidget{
  final bool isLogged;
  const MyApp({required this.isLogged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final appRouter=ref.watch(appRouterProvider);
    final isDarkMode=ref.watch(appThemeGlobalProvider);
    final AppthemeNew appTheme=ref.watch(themeNotifierProvider);
    

            return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const[
        Locale('es','ES'),
        Locale('en','US')
      ],
      title: "Cute App",
      // theme: AppthemeNew(isDarkMode:isDarkMode ,selectedColor:2 ).getTheme(),
      theme: appTheme.getTheme(),
      // darkTheme: AppTheme.dark,
      // themeMode: ThemeMode.light,
      routerConfig:appRouter,
    );
  }
}

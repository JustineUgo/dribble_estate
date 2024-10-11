import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real/src/app.dart';
import 'package:real/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: EstateTheme.themeData,
      home: const App(),
    );
  }
}

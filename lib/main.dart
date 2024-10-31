import 'package:firebase_core/firebase_core.dart';
import 'package:florist/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Florist",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.green, 
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.green, 
        brightness: Brightness.dark, 
      ),
      themeMode: ThemeMode.system, 
    ),
  );
}

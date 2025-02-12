import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/config/theme/app_theme.dart';
import 'package:portfolio/core/route/route_pages.dart';
import 'package:portfolio/core/route/routes.dart';
import 'package:portfolio/features/auth/bindings/auth_binding.dart';
import 'package:portfolio/features/common/binding/init_binding.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      initialBinding: InitBinding(),
      getPages: RoutePages.ROUTES,
    );
  }
}

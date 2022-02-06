import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:runner_project/notifier/auth.notifier.dart';
import 'package:runner_project/notifier/notifier_list_typs.dart';

import 'views/login_page.dart';
import 'views/home_page.dart';
import 'views/account_activation_page.dart';
import 'utils/custom_animation.dart';

void main() {
  configLoading();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthNotifier()),
      ChangeNotifierProvider(create: (_) => TrainingPlanListNotifier()),
      ChangeNotifierProvider(create: (_) => MealPlanListNotifier()),
      ChangeNotifierProvider(create: (_) => PaymentListNotifier()),
    ],
    child: const MyApp()
    ));
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.rotatingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/activate': (context) => const AccountActivationPage(),
      },
      builder: EasyLoading.init(),
    );
  }
}


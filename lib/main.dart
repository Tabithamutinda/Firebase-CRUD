import 'package:firehub/Pages/splash_screen.dart';
import 'package:firehub/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
} 

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      // theme: ThemeData(
      // ),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
         Locale('en'),
      ],
      
      home: const SplashScreen(),
    );
  }
}


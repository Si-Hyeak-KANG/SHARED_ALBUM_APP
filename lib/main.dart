import 'package:flutter/material.dart';
import 'package:gachi_ganjik/screens/common/main_screen.dart';
import 'package:gachi_ganjik/screens/common/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '같이간직',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/main':
              return MaterialPageRoute(builder: (context) => const MainScreen());
          }
        },
        home: const SplashScreen(),
      );
  }
}

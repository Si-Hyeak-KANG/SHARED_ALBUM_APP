import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gachi_ganjik/screens/photos/photo_album_main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // TODO 1) 업데이트 안내 모달
    // TODO 2) 자동 로그인
    startTime();
  }

  startTime() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PhotoAlbumMainScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text('splash screen'),
        )
    );
  }

}
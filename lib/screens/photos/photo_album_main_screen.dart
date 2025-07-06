import 'package:flutter/material.dart';

class PhotoAlbumMainScreen extends StatefulWidget {

  const PhotoAlbumMainScreen({super.key}); // 생성자 수정!

  @override
  State<StatefulWidget> createState() {
    return _PhotoAlbumMainScreen();
  }
}

class _PhotoAlbumMainScreen extends State<PhotoAlbumMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('메인 화면')),
    );
  }
}
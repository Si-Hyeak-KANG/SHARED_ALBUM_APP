// lib/screens/user_screen.dart (경로에 맞게 수정!)
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('사용자'),
        backgroundColor: Colors.lightBlue[200], // 사용자 페이지 느낌 나게 하늘색으로 해볼까?
      ),
      body: const Center(
        child: Text(
          '👤 사용자 화면입니다 👤',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
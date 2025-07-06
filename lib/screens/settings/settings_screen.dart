// lib/screens/settings_screen.dart (경로에 맞게 수정!)
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
        backgroundColor: Colors.grey[200], // 설정 페이지 느낌 나게 회색으로 해볼까?
      ),
      body: const Center(
        child: Text(
          '⚙️ 설정 화면입니다 ⚙️',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
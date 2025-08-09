// lib/login_page.dart
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _onSocialLoginPressed(BuildContext context, String socialType) {
    print('$socialType 로그인 버튼 클릭! 🎉');
    // TODO: 여기에 실제 각 소셜 로그인 패키지(google_sign_in, kakao_flutter_sdk 등) 호출 로직이 들어가!
    // 예: if (socialType == 'Google') { /* 구글 로그인 로직 */ }

    // 임시로 로그인 성공 시 메인 화면으로 이동하도록 해볼게!
    // 실제로는 소셜 로그인 성공 콜백에서 이 코드를 호출해야겠지?
    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  '같이 간직',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const Text(
                  '함께 만드는 사진첩',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(context, 'Google', Colors.white, Colors.black, Icons.android),
                const SizedBox(width: 20),
                _buildSocialButton(context, 'Kakao', const Color(0xFFFFE500), Colors.black, Icons.chat),
                const SizedBox(width: 20),
                _buildSocialButton(context, 'Naver', const Color(0xFF03C75A), Colors.white, Icons.web),
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              '간편하게 로그인하고 시작하세요!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
      BuildContext context, String type, Color bgColor, Color textColor, IconData iconData) {
    return InkWell(
      onTap: () => _onSocialLoginPressed(context, type),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300, width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          // 실제 로고 이미지
          // Image.asset(
          //   'assets/icons/${type.toLowerCase()}_logo.png', // assets/icons/google_logo.png 이런 식으로
          //   width: 30, // 아이콘 크기
          //   height: 30,
          // ),
            child: Icon(
              iconData,
              color: textColor,
              size: 30,
            )
        ),
      ),
    );
  }
}
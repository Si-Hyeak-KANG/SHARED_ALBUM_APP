import 'package:flutter/material.dart';
import 'package:gachi_ganjik/widgets/common_app_bar_with_title.dart';

class EnterOtherAlbumNumScreen extends StatelessWidget {
  const EnterOtherAlbumNumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWithTitle(
        titleText: "사진 찍어주기",
        isActions: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 80),
            const Text(
              '번호로 입장하기',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              '공유번호나 QR 코드를 활용하여,\n다른 분의 소중한 사진첩에 입장하실 수 있습니다.\n\n이 공간에서 소중한 추억을 함께 기록하고 만들어나가세요.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 250,
                child: TextField(
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    filled: false,
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 1.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 14,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // 번호로 입장 버튼 눌렀을 때 동작
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                '입장하기',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                // QR 코드로 입장 버튼 눌렀을 때 동작
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'QR 코드로 입장하기',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

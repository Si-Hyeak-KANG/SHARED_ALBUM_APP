import 'package:flutter/material.dart';

class CommonAppBarWithTitle extends StatelessWidget
    implements PreferredSizeWidget {
  final String titleText;
  final bool isActions;

  const CommonAppBarWithTitle({
    super.key,
    required this.titleText,
    required this.isActions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          titleText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      centerTitle: true,
      actions: isActions
          ? [
              IconButton(
                icon: const Icon(Icons.menu), // 설정 아이콘! ⚙️
                onPressed: () {
                  print('설정 버튼 눌림!');
                },
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // AppBar의 기본 높이!
}

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
      actions: isActions ? [] : null, // TODO 검색, 알림
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // AppBar 기본 높이
}

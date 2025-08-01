import 'package:flutter/material.dart';
import 'package:gachi_ganjik/screens/photos/photo_album_screen.dart';
import 'package:gachi_ganjik/widgets/common_app_bar_with_title.dart';

class MakeNewAlbumScreen extends StatefulWidget {
  const MakeNewAlbumScreen({super.key});

  @override
  State<MakeNewAlbumScreen> createState() => _MakeNewAlbumScreenState();
}

class _MakeNewAlbumScreenState extends State<MakeNewAlbumScreen> {
  late TextEditingController _albumTitleController;

  @override
  void initState() {
    super.initState();
    _albumTitleController = TextEditingController();
  }

  @override
  void dispose() {
    _albumTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWithTitle(
        titleText: "사진첩 만들기",
        isActions: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      child: TextFormField(
                        controller: _albumTitleController,
                        decoration: InputDecoration(labelText: '사진첩 제목'),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      child: TextField(
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
                        keyboardType: TextInputType.text,
                        maxLength: 50,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                final String albumTitle = _albumTitleController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoAlbumScreen(albumTitle: albumTitle),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                '만들기',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

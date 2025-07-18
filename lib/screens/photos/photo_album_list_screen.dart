import 'package:flutter/material.dart';
import 'package:gachi_ganjik/screens/photos/enter_other_album_num_screen.dart';
import 'package:gachi_ganjik/screens/photos/make_new_album_screen.dart';
import 'package:gachi_ganjik/screens/photos/photo_album_screen.dart';

class PhotoAlbumListScreen extends StatefulWidget {
  const PhotoAlbumListScreen({super.key}); // 생성자 수정!

  @override
  State<StatefulWidget> createState() {
    return _PhotoAlbumListScreen();
  }
}

class _PhotoAlbumListScreen extends State<PhotoAlbumListScreen> {
  final List<String> albumTitles =
      List.generate(6, (index) => 'Title ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Image.asset(
              'assets/images/header_app_logo.png',
              width: 150,
              height: 250,
              fit: BoxFit.contain, // contain으로 바꿔서 비율 유지하면서 공간에 맞춰보자!
            ),
          ),
          centerTitle: false,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EnterOtherAlbumNumScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(double.infinity, 45.0),
                      foregroundColor: Colors.black,
                    ),
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 28.0,
                      color: Colors.black,
                    ),
                    label: const Text('사진 찍어주기'),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MakeNewAlbumScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(double.infinity, 45.0),
                      foregroundColor: Colors.black,
                    ),
                    icon: const Icon(
                      Icons.photo_album_outlined,
                      size: 28.0,
                      color: Colors.black,
                    ),
                    label: const Text('사진첩 만들기'),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),
          // 앨범 리스트 (GridView)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: albumTitles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2열
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3 / 4, // 가로:세로 비율 조절
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PhotoAlbumScreen(albumTitle: albumTitles[index]),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.grey.shade200,
                              child: const Icon(
                                Icons.image_outlined,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              albumTitles[index],
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

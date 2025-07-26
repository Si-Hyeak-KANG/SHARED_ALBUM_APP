import 'package:flutter/material.dart';
import 'package:gachi_ganjik/screens/photos/enter_other_album_num_screen.dart';
import 'package:gachi_ganjik/screens/photos/make_new_album_screen.dart';
import 'package:gachi_ganjik/screens/photos/photo_album_screen.dart';

class PhotoAlbumListScreen extends StatefulWidget {
  const PhotoAlbumListScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PhotoAlbumListScreen();
  }
}

class _PhotoAlbumListScreen extends State<PhotoAlbumListScreen> {
  final List<String> albumTitles =
      List.generate(6, (index) => 'Title ${index + 1}');

  final List<String> albumImages = [
    'assets/images/photo1.png',
    'assets/images/photo2.png',
    'assets/images/photo3.png',
    'assets/images/photo4.png',
    'assets/images/photo5.png',
    'assets/images/photo6.png',
  ];

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
              fit: BoxFit.contain,
            ),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 10.0),
              child: IconButton(
                onPressed: () {
                  debugPrint('알림 버튼 눌림!'); // 다른 사용자가 내 사진첩에 사진을 기록했을 때 알림
                },
                icon: const Icon(Icons.notifications_none, size: 32.0,),
                // icon: const Icon(Icons.notifications, size:30.0, color: Colors.yellow), // 꽉 찬 종 모양 아이콘!
              ),
            ),
          ],
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

          // TODO 앨범 우측 상단 Pined 기능 구현
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
                            child: ClipRRect( // 이미지가 모서리 둥글게 잘리도록 ClipRRect 추가!
                              borderRadius: BorderRadius.vertical(top: Radius.circular(8)), // 위쪽만 둥글게
                              child: Image.asset( // Image.asset 또는 Image.network 사용
                                albumImages[index], // 여기가 이미지 경로!
                                fit: BoxFit.cover, // 컨테이너에 꽉 채우도록 설정
                                // loadingBuilder: (BuildContext context, Widget child,
                                //     ImageChunkEvent? loadingProgress) {
                                //   if (loadingProgress == null) return child;
                                //   return Center( // 이미지 로딩 중일 때 로딩 스피너 보여주기
                                //     child: CircularProgressIndicator(
                                //       value: loadingProgress.expectedTotalBytes != null
                                //           ? loadingProgress.cumulativeBytesLoaded /
                                //           loadingProgress.expectedTotalBytes!
                                //           : null,
                                //     ),
                                //   );
                                // },
                                errorBuilder: (context, error, stackTrace) {
                                  return Container( // 이미지 로딩 실패 시 보여줄 기본 아이콘
                                    color: Colors.grey.shade200,
                                    child: const Icon(
                                      Icons.broken_image,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  albumTitles[index],
                                  style: const TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '2024.01 ~ 2025.05', // 앨범 생성 일자 ~ 마지막 사진 업데이트 일자
                                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                  textAlign: TextAlign.center,
                                ),
                              ],
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

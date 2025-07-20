import 'package:flutter/material.dart';

import 'package:gachi_ganjik/widgets/common_app_bar_with_title.dart';
import '../../widgets/camera_header_delegate.dart';

class PhotoAlbumScreen extends StatefulWidget {
  final String albumTitle;

  const PhotoAlbumScreen({super.key, required this.albumTitle});

  @override
  State<PhotoAlbumScreen> createState() => _PhotoAlbumScreenState();
}

class _PhotoAlbumScreenState extends State<PhotoAlbumScreen> {
  // 스크롤 컨트롤러 선언!
  late ScrollController _scrollController;
  // 사진 리스트 (여기선 간단히 String으로 대체할게. 실제로는 Photo 객체 등이 될 수 있어)
  List<String> _photos = [];
  // 데이터 로딩 중인지 여부
  bool _isLoading = false;
  // 더 로드할 데이터가 남아있는지 여부
  bool _hasMore = true;
  // 현재 페이지 번호
  int _currentPage = 0;
  // 한 번에 불러올 사진 개수
  final int _itemsPerPage = 9;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // 스크롤 리스너 추가!
    _scrollController.addListener(_scrollListener);
    // 초기 데이터 로드!
    _fetchPhotos();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // 스크롤 리스너 함수
  void _scrollListener() {
    // 현재 스크롤 위치가 최대 스크롤 위치에 거의 도달했을 때
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // 로딩 중이 아니고, 더 로드할 데이터가 남아있으면!
      if (!_isLoading && _hasMore) {
        _fetchPhotos(); // 데이터 로드!
      }
    }
  }

  // API에서 사진 데이터를 불러오는 함수 (가짜 데이터로 시뮬레이션)
  Future<void> _fetchPhotos() async {
    if (_isLoading) return; // 이미 로딩 중이면 중복 호출 방지!
    setState(() {
      _isLoading = true; // 로딩 시작!
    });

    await Future.delayed(const Duration(seconds: 1)); // 1초 정도 로딩되는 것처럼 보이게!

    final int start = _currentPage * _itemsPerPage;
    final int end = start + _itemsPerPage;
    final int totalMockPhotos = 30; // TODO : API

    List<String> newPhotos = [];
    for (int i = start; i < end && i < totalMockPhotos; i++) {
      newPhotos.add('Photo ${i + 1}');
    }

    setState(() {
      _photos.addAll(newPhotos);
      _currentPage++;
      _isLoading = false;
      if (newPhotos.length < _itemsPerPage || _photos.length >= totalMockPhotos) {
        _hasMore = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double cameraBoxHeight = 76.0; // 이전에 설정했던 높이!

    return Scaffold(
      appBar: CommonAppBarWithTitle(
        titleText: widget.albumTitle,
        isActions: true,
      ),
      body: CustomScrollView(
        controller: _scrollController, // ✨ 여기! 스크롤 컨트롤러 연결!
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: 260,
                  color: Colors.grey[300],
                  child: Center(
                      child:
                      Icon(Icons.image, size: 80, color: Colors.grey[600])),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: FloatingActionButton(
                    onPressed: () {},
                    mini: true,
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
          // 기존 코드와 동일 (참여자 아바타 및 설명 텍스트)
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.person_outline),
                          ),
                          const SizedBox(width: 2),
                          CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Icon(Icons.person)),
                          const SizedBox(width: 2),
                          CircleAvatar(child: Icon(Icons.add)),
                        ],
                      ),
                      Spacer(),
                      Text('2025.04.18',
                          style:
                          TextStyle(fontSize: 14, color: Colors.grey[600])),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 110,
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Text(
                      '이 앨범은 우리의 소중한 추억들을 담고 있어요. 함께 했던 순간들을 기억하며, 찰칵!',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 기존 코드와 동일 (카메라 아이콘 박스 - SliverPersistentHeader)
          SliverPersistentHeader(
            pinned: true,
            delegate: CameraHeaderDelegate(
              minHeight: cameraBoxHeight,
              maxHeight: cameraBoxHeight,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Color(0x4D9E9E9E),
                      width: 0.5,
                    ),
                  ),
                ),
                child: Center(
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: 카메라 촬영 또는 갤러리 열기 기능 추가
                    },
                    style: OutlinedButton.styleFrom(
                      shape: CircleBorder(),
                      side: BorderSide(color: Colors.blueGrey.shade200, width: 1),
                      padding: EdgeInsets.all(12),
                    ),
                    child: Icon(Icons.camera_alt_outlined,
                        size: 28, color: Colors.blueGrey),
                  ),
                ),
              ),
            ),
          ),
          // 사진 목록 (페이징 적용)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  // 여기서는 실제 사진 대신 'Photo N' 같은 텍스트를 표시
                  return Stack(
                    children: [
                      Container(
                        color: Colors.grey[300],
                        child: Center(
                            child: Text(
                              _photos[index], // ✨ 로드된 사진 데이터를 표시
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                      ),
                      if (index % 4 == 0) // 예시 로직 (하트 아이콘)
                        Positioned(
                          top: 4,
                          right: 4,
                          child:
                          Icon(Icons.favorite, color: Colors.red, size: 18),
                        ),
                    ],
                  );
                },
                childCount: _photos.length, // ✨ 로드된 사진의 개수만큼만 보여줘!
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 한 줄에 3개 이미지
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1.0,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _isLoading && _hasMore
                ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(child: CircularProgressIndicator()),
            )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
import 'package:closetok/src/features/videos/widgets/video_post.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Video 화면
class VideosScreen extends StatefulWidget {
  static const String routeUrl = "video";
  static const String routeName = "videoScreen";
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  List<String> videos = [
    "assets/videos/snowing.mp4",
    "assets/videos/snowing.mp4",
    "assets/videos/snowing.mp4",
  ];

  /// 비디오 변경
  void _onPageChange(index) {
    // 마지막 직전이면 다음 데이터 fetch
    if (index == videos.length - 2) {
      if (kDebugMode) {
        print('fetch new videos');
      }
      videos.addAll([
        "assets/videos/snowing.mp4",
        "assets/videos/snowing.mp4",
      ]);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        // TODO - refetch
        return Future.delayed(const Duration(seconds: 3));
      },
      child: Stack(
        children: [
          // video
          Positioned.fill(
            // TODO - fetch videos
            child: PageView.builder(
              onPageChanged: _onPageChange,
              scrollDirection: Axis.vertical,
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return VideoPost(
                  index: index,
                  url: video,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

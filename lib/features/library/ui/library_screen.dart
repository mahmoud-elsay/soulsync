import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/widgets/app_top_bar.dart';
import 'package:soulsync/core/theming/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soulsync/features/library/ui/widgets/track_item_row.dart';
import 'package:soulsync/features/library/ui/widgets/track_container.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Top Bar
            SliverToBoxAdapter(child: const AppTopBar()),

            // Featured Track Container
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    verticalSpace(24),
                    const TrackContainer(),
                    verticalSpace(32),
                  ],
                ),
              ),
            ),

            // Tracks List
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _buildTrackItem(index);
                  },
                  childCount: 4, // Number of tracks
                ),
              ),
            ),

            // Bottom spacing for navigation bar
            SliverToBoxAdapter(child: verticalSpace(100)),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackItem(int index) {
    final tracks = [
      {
        'title': 'Painting Forest',
        'listeners': '59899 Listening',
        'duration': '20 Min',
        'image': 'assets/images/track_rectangle.png',
      },
      {
        'title': 'Mountaineers',
        'listeners': '45679 Listening',
        'duration': '15 Min',
        'image': 'assets/images/track_rectangle.png',
      },
      {
        'title': 'Lovely Deserts',
        'listeners': '9452 Listening',
        'duration': '39 Min',
        'image': 'assets/images/track_rectangle.png',
      },
      {
        'title': 'The Hill Sides',
        'listeners': '56897 Listening',
        'duration': '50 Min',
        'image': 'assets/images/track_rectangle.png',
      },
    ];

    final track = tracks[index];

    return TrackItemRow(
      title: track['title']!,
      listeners: track['listeners']!,
      duration: track['duration']!,
      imagePath: track['image']!,
    );
  }
}

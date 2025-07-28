import 'package:flutter/material.dart';
import 'package:soulsync/features/library/ui/widgets/track_item_row.dart';

class TracksListView extends StatelessWidget {
  const TracksListView({super.key});

  @override
  Widget build(BuildContext context) {
    final tracks = [
      {
        'title': 'Painting Forest',
        'listeners': '59899 Listening',
        'duration': '20 Min',
        'image': 'assets/images/painting_forest.png',
      },
      {
        'title': 'Mountaineers',
        'listeners': '45679 Listening',
        'duration': '15 Min',
        'image': 'assets/images/mountaineers.png',
      },
      {
        'title': 'Lovely Deserts',
        'listeners': '9452 Listening',
        'duration': '39 Min',
        'image': 'assets/images/lovely_deserts.png',
      },
      {
        'title': 'The Hill Sides',
        'listeners': '56897 Listening',
        'duration': '50 Min',
        'image': 'assets/images/hill_sides.png',
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        final track = tracks[index];
        return TrackItemRow(
          title: track['title']!,
          listeners: track['listeners']!,
          duration: track['duration']!,
          imagePath: track['image']!,
        );
      },
    );
  }
}

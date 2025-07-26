import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';

class TrackInfoWidget extends StatelessWidget {
  final String title;
  final String artist;

  const TrackInfoWidget({super.key, required this.title, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyles.whiteAlegreya35Medium),
        verticalSpace(6),
        Text(artist, style: TextStyles.whiteAlegreyaSans25Regular),
      ],
    );
  }
}

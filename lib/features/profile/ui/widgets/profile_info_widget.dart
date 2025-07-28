import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:soulsync/features/profile/ui/widgets/profile_image.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Image
        const ProfileImage(),

        verticalSpace(24),

        // Name
        Text("Adam Khan", style: TextStyles.whiteAlegreyaSans45Medium),

        verticalSpace(8),

        // Location
        Text("Lucknow, India", style: TextStyles.whiteAlegreyaSans20Regular),
      ],
    );
  }
}

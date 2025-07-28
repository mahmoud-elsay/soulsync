import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 124.r, // 248/2 = 124 for radius
      backgroundImage: const AssetImage('assets/images/person.png'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/features/home/ui/widgets/home_list_view_item.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  static final List<Map<String, String>> _meditationItems = [
    {
      'title': 'Meditation 101',
      'subtitle': "Techniques, Benefits,\nand a Beginner’s How-To",
      'imagePath': 'assets/images/first_container_image.png',
    },
    {
      'title': 'Mindful Breathing',
      'subtitle': "Learn to Focus on Your\nBreath for Inner Peace",
      'imagePath': 'assets/images/second_container_image.png',
    },
    {
      'title': 'Stress Relief',
      'subtitle': "Quick Techniques to\nCalm Your Mind",
      'imagePath': 'assets/images/first_container_image.png',
    },
    {
      'title': 'Deep Relaxation',
      'subtitle': "Progressive Muscle\nRelaxation Guide",
      'imagePath': 'assets/images/second_container_image.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _meditationItems.length,
      separatorBuilder: (context, index) => verticalSpace(16),
      itemBuilder: (context, index) {
        final item = _meditationItems[index];
        return HomeListViewItem(
          title: item['title']!,
          subtitle: item['subtitle']!,
          imagePath: item['imagePath']!,
        );
      },
    );
  }
}

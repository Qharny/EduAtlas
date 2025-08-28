import 'package:flutter/material.dart';

import '../../models/model.dart';
import '../university/university_card.dart';

class UniversityListSection extends StatelessWidget {
  final List<University> universities;
  final Function(University) onUniversityTap;

  const UniversityListSection({
    super.key,
    required this.universities,
    required this.onUniversityTap,
  });

  @override
  Widget build(BuildContext context) {
    if (universities.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final university = universities[index];
            return TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 300 + (index * 100)),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, 50 * (1 - value)),
                  child: Opacity(
                    opacity: value,
                    child: UniversityCard(
                      university: university,
                      onTap: () => onUniversityTap(university),
                      index: index,
                    ),
                  ),
                );
              },
            );
          },
          childCount: universities.length,
        ),
      ),
    );
  }
} 
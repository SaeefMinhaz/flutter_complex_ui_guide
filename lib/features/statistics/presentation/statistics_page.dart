import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';

/// Statistics tab content. Standings, Top Players in F14–F16.
class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Statistics',
        style: AppTextStyles.sectionHeader.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}

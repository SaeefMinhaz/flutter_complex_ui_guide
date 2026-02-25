import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';

/// Schedule tab content. Calendar, Live, Pre-match, Result in F5–F9.
class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Schedule',
        style: AppTextStyles.sectionHeader.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}

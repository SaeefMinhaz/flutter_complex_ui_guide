import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';

/// My games tab content. My Bets, My Teams, Teams Match in F10–F13.
class MyGamesPage extends StatelessWidget {
  const MyGamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'My games',
        style: AppTextStyles.sectionHeader.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}

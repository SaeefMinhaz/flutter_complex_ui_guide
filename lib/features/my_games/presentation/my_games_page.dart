import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import 'widgets/my_bets_row.dart';

/// My games tab content. My Bets (F10), My Teams, Teams Match in F11–F13.
class MyGamesPage extends StatelessWidget {
  const MyGamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: MyBetsRow(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'My teams · Teams\' matches (F11–F13)',
              style: AppTextStyles.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}

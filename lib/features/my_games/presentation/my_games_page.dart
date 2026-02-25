import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import 'widgets/my_bets_row.dart';
import 'widgets/my_teams_carousel.dart';

/// My games tab content. My Bets (F10), My Teams (F11), Teams Match in F12–F13.
class MyGamesPage extends StatelessWidget {
  const MyGamesPage({super.key});

  static const List<String> _exampleTeams = [
    'India',
    'Pakistan',
    'Netherlands',
    'Namibia',
    'USA',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: MyBetsRow(),
        ),
        SliverToBoxAdapter(
          child: MyTeamsCarousel(
            teamNames: _exampleTeams,
            onChangeTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Change teams')),
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Teams\' matches (F12–F13)',
              style: AppTextStyles.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}

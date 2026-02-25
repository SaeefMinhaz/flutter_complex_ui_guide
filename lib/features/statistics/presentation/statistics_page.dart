import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import 'widgets/standings_card.dart';

/// Statistics tab content. Standings card (F14), Top players in F15–F16.
class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: StandingsCard(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Standings tapped')),
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Top players (F15–F16)',
              style: AppTextStyles.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}

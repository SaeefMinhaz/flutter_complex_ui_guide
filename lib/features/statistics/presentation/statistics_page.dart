import 'package:flutter/material.dart';

import '../../../core/widgets/widgets.dart';
import 'widgets/standings_card.dart';
import 'widgets/top_player_list_item.dart';

/// Statistics tab content. Standings card (F14), Top players list (F15–F16).
class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  static const _players = [
    (1, 'Tim Seifert', 'New Zealand', 453),
    (2, 'Rahmanullah Gurbaz', 'Afghanistan', 331),
    (3, 'George Munsey', 'Scotland', 288),
    (4, 'Sherfane Rutherford', 'Guyana', 279),
    (5, 'Jacob Graham Bethell', 'England', 263),
  ];

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
        const SliverToBoxAdapter(
          child: SectionHeader(title: 'Top players'),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final (rank, name, country, runs) = _players[index];
              return TopPlayerListItem(
                rank: rank,
                name: name,
                country: country,
                runs: runs,
              );
            },
            childCount: _players.length,
          ),
        ),
      ],
    );
  }
}

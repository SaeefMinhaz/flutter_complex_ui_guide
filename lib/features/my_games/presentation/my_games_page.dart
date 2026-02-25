import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';
import '../../schedule/presentation/widgets/pre_match_event_card.dart';
import 'widgets/my_bets_row.dart';
import 'widgets/my_teams_carousel.dart';

/// My games tab content. My Bets (F10), My Teams (F11), Teams' matches (F12–F13).
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
        const SliverToBoxAdapter(
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
        const SliverToBoxAdapter(
          child: SectionHeader(title: "Teams' matches"),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              PreMatchEventCard(
                competitionText: "T20 World Cup. 2026. Group stage. Group A",
                team1Name: 'Pakistan',
                team2Name: 'Namibia',
                countdownText: '03 : 44 : 43',
                dateTimeText: '18.02.26 15:30',
                team1Leading: _flagPlaceholder(),
                team2Leading: _flagPlaceholder(),
                w1Value: '1.079',
                xValue: '25',
                w2Value: '8.8',
              ),
              PreMatchEventCard(
                competitionText: "T20 World Cup. 2026. Group stage. Group A",
                team1Name: 'India',
                team2Name: 'Netherlands',
                countdownText: '05 : 12 : 00',
                dateTimeText: '18.02.26 18:00',
                team1Leading: _flagPlaceholder(),
                team2Leading: _flagPlaceholder(),
                w1Value: '1.05',
                xValue: '26',
                w2Value: '9.2',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _flagPlaceholder() => Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(4),
      ),
    );

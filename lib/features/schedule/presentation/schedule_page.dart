import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';
import 'widgets/live_event_card.dart';
import 'widgets/pre_match_event_card.dart';
import 'widgets/schedule_calendar_strip.dart';

/// Schedule tab content. Calendar strip (F5), Live (F6), Pre-match/Result in F7–F9.
class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  /// Example range: 14–20 February 2026 (F9 will provide dates from Bloc).
  static List<DateTime> get _exampleDates {
    const int year = 2026;
    const int month = DateTime.february;
    return List.generate(7, (i) => DateTime(year, month, 14 + i));
  }

  static Widget _flagPlaceholder() => Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(4),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ScheduleCalendarStrip(
            dates: _exampleDates,
            initialSelectedIndex: 4,
            eventDotDateIndices: const {3, 4},
            onDateSelected: (_) {},
          ),
        ),
        SliverToBoxAdapter(
          child: SectionHeader(
            title: 'Live events',
            trailing: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.liveIndicator,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            LiveEventCard(
              competitionText: "T20 World Cup. 2026. Group stage. Group D",
              team1Name: 'South Africa',
              team1Score: '0/0',
              team2Name: 'United Arab Emirates',
              team2Score: '29/0 (2.5 ov)',
              team1Leading: _flagPlaceholder(),
              team2Leading: _flagPlaceholder(),
            ),
          ]),
        ),
        SliverToBoxAdapter(
          child: SectionHeader(title: 'Pre-match events'),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
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
          ]),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Results (F8–F9)',
              style: AppTextStyles.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}

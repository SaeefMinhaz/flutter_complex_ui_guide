import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import 'widgets/schedule_calendar_strip.dart';

/// Schedule tab content. Calendar strip (F5), Live/Pre-match/Result in F6–F9.
class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  /// Example range: 14–20 February 2026 (F9 will provide dates from Bloc).
  static List<DateTime> get _exampleDates {
    const int year = 2026;
    const int month = DateTime.february;
    return List.generate(7, (i) => DateTime(year, month, 14 + i));
  }

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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Live events · Pre-match · Results (F6–F9)',
              style: AppTextStyles.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';
import '../data/repositories/mock_schedule_repository.dart';
import '../domain/usecases/get_schedule_for_date_usecase.dart';
import 'bloc/schedule_bloc.dart';
import 'bloc/schedule_event.dart';
import 'bloc/schedule_state.dart';
import 'widgets/live_event_card.dart';
import 'widgets/pre_match_event_card.dart';
import 'widgets/result_event_card.dart';
import 'widgets/schedule_calendar_strip.dart';

/// Schedule tab content. Calendar (F5), Live (F6), Pre-match (F7), Result (F8), Bloc (F9).
class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScheduleBloc(
        GetScheduleForDateUseCase(MockScheduleRepository()),
      )..add(ScheduleRequested(initialDate: DateTime(2026, 2, 18))),
      child: const _ScheduleView(),
    );
  }
}

class _ScheduleView extends StatelessWidget {
  const _ScheduleView();

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
    return BlocBuilder<ScheduleBloc, ScheduleState>(
      buildWhen: (prev, next) =>
          prev.dates != next.dates ||
          prev.selectedDate != next.selectedDate ||
          prev.liveEvents != next.liveEvents ||
          prev.preMatchEvents != next.preMatchEvents ||
          prev.resultEvents != next.resultEvents ||
          prev.eventDotDateIndices != next.eventDotDateIndices ||
          prev.status != next.status,
      builder: (context, state) {
        if (state.status == ScheduleStatus.initial ||
            state.status == ScheduleStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        final dates = state.dates.isEmpty ? _fallbackDates() : state.dates;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ScheduleCalendarStrip(
                dates: dates,
                initialSelectedIndex: state.selectedDateIndex.clamp(0, dates.length - 1),
                eventDotDateIndices: state.eventDotDateIndices,
                onDateSelected: (date) =>
                    context.read<ScheduleBloc>().add(ScheduleDateSelected(date)),
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
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final e = state.liveEvents[index];
                  return LiveEventCard(
                    competitionText: e.competitionText,
                    team1Name: e.team1Name,
                    team1Score: e.team1Score,
                    team2Name: e.team2Name,
                    team2Score: e.team2Score,
                    team1Leading: _flagPlaceholder(),
                    team2Leading: _flagPlaceholder(),
                  );
                },
                childCount: state.liveEvents.length,
              ),
            ),
            SliverToBoxAdapter(
              child: SectionHeader(title: 'Pre-match events'),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final e = state.preMatchEvents[index];
                  return PreMatchEventCard(
                    competitionText: e.competitionText,
                    team1Name: e.team1Name,
                    team2Name: e.team2Name,
                    countdownText: e.countdownText,
                    dateTimeText: e.dateTimeText,
                    team1Leading: _flagPlaceholder(),
                    team2Leading: _flagPlaceholder(),
                    w1Value: e.w1Value,
                    xValue: e.xValue,
                    w2Value: e.w2Value,
                  );
                },
                childCount: state.preMatchEvents.length,
              ),
            ),
            SliverToBoxAdapter(
              child: SectionHeader(title: 'Results'),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final e = state.resultEvents[index];
                  return ResultEventCard(
                    competitionText: e.competitionText,
                    team1Name: e.team1Name,
                    team1Score: e.team1Score,
                    team2Name: e.team2Name,
                    team2Score: e.team2Score,
                    dateTimeText: e.dateTimeText,
                    team1Leading: _flagPlaceholder(),
                    team2Leading: _flagPlaceholder(),
                  );
                },
                childCount: state.resultEvents.length,
              ),
            ),
          ],
        );
      },
    );
  }

  static List<DateTime> _fallbackDates() {
    const year = 2026;
    const month = DateTime.february;
    return List.generate(7, (i) => DateTime(year, month, 14 + i));
  }
}

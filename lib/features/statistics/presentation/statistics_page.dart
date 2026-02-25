import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/widgets.dart';
import '../data/statistics_repository.dart';
import '../domain/usecases/get_statistics_usecase.dart';
import 'bloc/statistics_bloc.dart';
import 'bloc/statistics_event.dart';
import 'bloc/statistics_state.dart';
import 'widgets/standings_card.dart';
import 'widgets/top_player_list_item.dart';

/// Statistics tab content. Standings card (F14), Top players list (F15–F16) with Bloc (F16).
class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StatisticsBloc(
        const GetStatisticsUseCase(MockStatisticsRepository()),
      )..add(const StatisticsRequested()),
      child: const _StatisticsView(),
    );
  }
}

class _StatisticsView extends StatelessWidget {
  const _StatisticsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsBloc, StatisticsState>(
      builder: (context, state) {
        if (state.status == StatisticsStatus.initial ||
            state.status == StatisticsStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

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
                  final player = state.topPlayers[index];
                  return TopPlayerListItem(
                    rank: player.rank,
                    name: player.name,
                    country: player.country,
                    runs: player.runs,
                  );
                },
                childCount: state.topPlayers.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

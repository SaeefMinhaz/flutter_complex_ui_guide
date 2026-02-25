import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';
import '../../schedule/presentation/widgets/pre_match_event_card.dart';
import '../data/my_games_repository.dart';
import '../domain/usecases/get_my_games_usecase.dart';
import 'bloc/my_games_bloc.dart';
import 'bloc/my_games_event.dart';
import 'bloc/my_games_state.dart';
import 'widgets/my_bets_row.dart';
import 'widgets/my_teams_carousel.dart';

/// My games tab content. My Bets (F10), My Teams (F11), Teams' matches (F12–F13) with Bloc (F13).
class MyGamesPage extends StatelessWidget {
  const MyGamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyGamesBloc(
        const GetMyGamesUseCase(MockMyGamesRepository()),
      )..add(const MyGamesRequested()),
      child: const _MyGamesView(),
    );
  }
}

class _MyGamesView extends StatelessWidget {
  const _MyGamesView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyGamesBloc, MyGamesState>(
      builder: (context, state) {
        if (state.status == MyGamesStatus.initial ||
            state.status == MyGamesStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: MyBetsRow(),
            ),
            SliverToBoxAdapter(
              child: MyTeamsCarousel(
                teamNames: state.teams.map((t) => t.name).toList(),
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
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final e = state.matches[index];
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
                childCount: state.matches.length,
              ),
            ),
          ],
        );
      },
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

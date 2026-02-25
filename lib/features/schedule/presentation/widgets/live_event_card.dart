import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';

/// Live match card: competition line, teams with scores, action icons, locked 1X2.
class LiveEventCard extends StatelessWidget {
  const LiveEventCard({
    super.key,
    required this.competitionText,
    required this.team1Name,
    required this.team1Score,
    required this.team2Name,
    required this.team2Score,
    this.team1Leading,
    this.team2Leading,
    this.onPlay,
    this.onNotify,
    this.onFavorite,
  });

  final String competitionText;
  final String team1Name;
  final String team1Score;
  final String team2Name;
  final String team2Score;
  final Widget? team1Leading;
  final Widget? team2Leading;
  final VoidCallback? onPlay;
  final VoidCallback? onNotify;
  final VoidCallback? onFavorite;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CompetitionRow(
            competitionText: competitionText,
            actions: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconActionButton(icon: Icons.play_arrow, onPressed: onPlay),
                const SizedBox(width: 8),
                IconActionButton(icon: Icons.notifications_none, onPressed: onNotify),
                const SizedBox(width: 8),
                IconActionButton(icon: Icons.star_border, onPressed: onFavorite),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text('T20', style: AppTextStyles.cardTitle),
          const SizedBox(height: 12),
          TeamRow(
            teamName: team1Name,
            trailingText: team1Score,
            leading: team1Leading,
          ),
          const SizedBox(height: 6),
          TeamRow(
            teamName: team2Name,
            trailingText: team2Score,
            leading: team2Leading,
          ),
          OddsChipRow(
            w1Locked: true,
            xLocked: true,
            w2Locked: true,
          ),
        ],
      ),
    );
  }
}

class _CompetitionRow extends StatelessWidget {
  const _CompetitionRow({
    required this.competitionText,
    required this.actions,
  });

  final String competitionText;
  final Widget actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CompetitionIcon(),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            competitionText,
            style: AppTextStyles.cardSubtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        actions,
      ],
    );
  }
}

class _CompetitionIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          'T',
          style: AppTextStyles.cardTitle.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}

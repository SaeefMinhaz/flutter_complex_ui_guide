import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';

/// Pre-match card: competition line, teams VS, countdown, date/time, 1X2 odds.
class PreMatchEventCard extends StatelessWidget {
  const PreMatchEventCard({
    super.key,
    required this.competitionText,
    required this.team1Name,
    required this.team2Name,
    required this.countdownText,
    required this.dateTimeText,
    this.team1Leading,
    this.team2Leading,
    this.w1Value,
    this.xValue,
    this.w2Value,
    this.onNotify,
    this.onFavorite,
    this.onW1Tap,
    this.onXTap,
    this.onW2Tap,
  });

  final String competitionText;
  final String team1Name;
  final String team2Name;
  final String countdownText;
  final String dateTimeText;
  final Widget? team1Leading;
  final Widget? team2Leading;
  final String? w1Value;
  final String? xValue;
  final String? w2Value;
  final VoidCallback? onNotify;
  final VoidCallback? onFavorite;
  final VoidCallback? onW1Tap;
  final VoidCallback? onXTap;
  final VoidCallback? onW2Tap;

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
                IconActionButton(icon: Icons.notifications_none, onPressed: onNotify),
                const SizedBox(width: 8),
                IconActionButton(icon: Icons.star_border, onPressed: onFavorite),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text('T20', style: AppTextStyles.cardTitle),
          const SizedBox(height: 12),
          _TeamVsRow(
            team1Name: team1Name,
            team2Name: team2Name,
            team1Leading: team1Leading,
            team2Leading: team2Leading,
          ),
          const SizedBox(height: 8),
          Text(countdownText, style: AppTextStyles.countdown),
          const SizedBox(height: 4),
          Text(dateTimeText, style: AppTextStyles.bodySmall),
          OddsChipRow(
            w1Value: w1Value,
            xValue: xValue,
            w2Value: w2Value,
            onW1Tap: onW1Tap,
            onXTap: onXTap,
            onW2Tap: onW2Tap,
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

class _TeamVsRow extends StatelessWidget {
  const _TeamVsRow({
    required this.team1Name,
    required this.team2Name,
    this.team1Leading,
    this.team2Leading,
  });

  final String team1Name;
  final String team2Name;
  final Widget? team1Leading;
  final Widget? team2Leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (team1Leading != null) ...[
          SizedBox(width: 24, height: 24, child: team1Leading),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            team1Name,
            style: AppTextStyles.body,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text('VS', style: AppTextStyles.cardTitle),
        ),
        Expanded(
          child: Text(
            team2Name,
            style: AppTextStyles.body,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        ),
        if (team2Leading != null) ...[
          const SizedBox(width: 8),
          SizedBox(width: 24, height: 24, child: team2Leading),
        ],
      ],
    );
  }
}

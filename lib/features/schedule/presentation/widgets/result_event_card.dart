import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';

/// Result card: competition line, teams with final scores, date/time, expandable "Additional information".
class ResultEventCard extends StatefulWidget {
  const ResultEventCard({
    super.key,
    required this.competitionText,
    required this.team1Name,
    required this.team1Score,
    required this.team2Name,
    required this.team2Score,
    required this.dateTimeText,
    this.team1Leading,
    this.team2Leading,
    this.onNotify,
    this.onFavorite,
    this.additionalContent,
  });

  final String competitionText;
  final String team1Name;
  final String team1Score;
  final String team2Name;
  final String team2Score;
  final String dateTimeText;
  final Widget? team1Leading;
  final Widget? team2Leading;
  final VoidCallback? onNotify;
  final VoidCallback? onFavorite;
  final Widget? additionalContent;

  @override
  State<ResultEventCard> createState() => _ResultEventCardState();
}

class _ResultEventCardState extends State<ResultEventCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CompetitionRow(
            competitionText: widget.competitionText,
            actions: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconActionButton(icon: Icons.notifications_none, onPressed: widget.onNotify),
                const SizedBox(width: 8),
                IconActionButton(icon: Icons.star_border, onPressed: widget.onFavorite),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text('T20', style: AppTextStyles.cardTitle),
          const SizedBox(height: 12),
          TeamRow(
            teamName: widget.team1Name,
            trailingText: widget.team1Score,
            leading: widget.team1Leading,
          ),
          const SizedBox(height: 6),
          TeamRow(
            teamName: widget.team2Name,
            trailingText: widget.team2Score,
            leading: widget.team2Leading,
          ),
          const SizedBox(height: 8),
          Text(widget.dateTimeText, style: AppTextStyles.bodySmall),
          const SizedBox(height: 12),
          _ExpandableSection(
            label: 'Additional information',
            expanded: _expanded,
            onTap: () => setState(() => _expanded = !_expanded),
            child: widget.additionalContent ??
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Match summary, scorecard and statistics will appear here.',
                    style: AppTextStyles.bodySmall,
                  ),
                ),
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

class _ExpandableSection extends StatelessWidget {
  const _ExpandableSection({
    required this.label,
    required this.expanded,
    required this.onTap,
    required this.child,
  });

  final String label;
  final bool expanded;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Text(
                    label,
                    style: AppTextStyles.body.copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: expanded ? child : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

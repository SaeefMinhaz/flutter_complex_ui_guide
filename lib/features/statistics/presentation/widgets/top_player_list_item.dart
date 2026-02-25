import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/card_container.dart';

class TopPlayerListItem extends StatelessWidget {
  const TopPlayerListItem({
    super.key,
    required this.rank,
    required this.name,
    required this.country,
    required this.runs,
  });

  final int rank;
  final String name;
  final String country;
  final int runs;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Text(
            '$rank',
            style: AppTextStyles.cardTitle.copyWith(
              fontSize: 18,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.surface,
            child: Text(
              name.isNotEmpty ? name[0] : '?',
              style: AppTextStyles.cardTitle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.body,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  country,
                  style: AppTextStyles.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _RunsBadge(runs: runs),
        ],
      ),
    );
  }
}

class _RunsBadge extends StatelessWidget {
  const _RunsBadge({required this.runs});

  final int runs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'RN',
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '$runs',
            style: AppTextStyles.score.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}


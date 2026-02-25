import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

/// Tappable row: blue circular clock icon + "My bets" label.
class MyBetsRow extends StatelessWidget {
  const MyBetsRow({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap ?? () => _defaultOnTap(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.schedule,
                  color: AppColors.onPrimary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Text(
                'My bets',
                style: AppTextStyles.sectionHeader,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _defaultOnTap(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('My bets')),
    );
  }
}

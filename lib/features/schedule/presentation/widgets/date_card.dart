import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

/// Single date in the calendar strip: day, month, selected state, optional event dot.
class DateCard extends StatelessWidget {
  const DateCard({
    super.key,
    required this.day,
    required this.month,
    this.isSelected = false,
    this.showEventDot = false,
    this.onTap,
  });

  final int day;
  final String month;
  final bool isSelected;
  final bool showEventDot;
  final VoidCallback? onTap;

  static const double width = 56;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.background,
          borderRadius: BorderRadius.circular(AppRadius.dateCard),
          boxShadow: isSelected
              ? null
              : [
                  BoxShadow(
                    color: AppColors.textPrimary.withValues(alpha: 0.06),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$day',
                    style: isSelected
                        ? AppTextStyles.dateDaySelected
                        : AppTextStyles.dateDay,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    month,
                    style: isSelected
                        ? AppTextStyles.dateMonthSelected
                        : AppTextStyles.dateMonth,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (showEventDot)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.eventDot,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

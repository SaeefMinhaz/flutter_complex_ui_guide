import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_text_styles.dart';

/// Label "1X2" plus three chips (W1, X, W2). Chip can show value or locked state.
class OddsChipRow extends StatelessWidget {
  const OddsChipRow({
    super.key,
    this.w1Label = 'W1',
    this.w1Value,
    this.w1Locked = false,
    this.xValue,
    this.xLocked = false,
    this.w2Label = 'W2',
    this.w2Value,
    this.w2Locked = false,
    this.onW1Tap,
    this.onXTap,
    this.onW2Tap,
  });

  final String w1Label;
  final String? w1Value;
  final bool w1Locked;
  final String? xValue;
  final bool xLocked;
  final String w2Label;
  final String? w2Value;
  final bool w2Locked;
  final VoidCallback? onW1Tap;
  final VoidCallback? onXTap;
  final VoidCallback? onW2Tap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('1X2', style: AppTextStyles.oddsLabel),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: _OddsChip(
                  label: w1Label,
                  value: w1Value,
                  locked: w1Locked,
                  onTap: onW1Tap,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _OddsChip(
                  label: 'X',
                  value: xValue,
                  locked: xLocked,
                  onTap: onXTap,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _OddsChip(
                  label: w2Label,
                  value: w2Value,
                  locked: w2Locked,
                  onTap: onW2Tap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OddsChip extends StatelessWidget {
  const _OddsChip({
    required this.label,
    this.value,
    required this.locked,
    this.onTap,
  });

  final String label;
  final String? value;
  final bool locked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: locked ? null : onTap,
        borderRadius: BorderRadius.circular(AppRadius.oddsChip),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.oddsChip),
          ),
          child: locked
              ? Icon(Icons.lock_outline, size: 18, color: AppColors.textInactive)
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(label, style: AppTextStyles.oddsLabel),
                    if (value != null) ...[
                      const SizedBox(height: 2),
                      Text(value!, style: AppTextStyles.oddsValue),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}

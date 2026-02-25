import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';

/// Horizontal carousel: "Change" chip + team chips (circular flag + name).
class MyTeamsCarousel extends StatelessWidget {
  const MyTeamsCarousel({
    super.key,
    required this.teamNames,
    this.onChangeTap,
  });

  final List<String> teamNames;
  final VoidCallback? onChangeTap;

  static const double _chipSize = 56;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'My teams'),
        SizedBox(
          height: 82,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _ChangeChip(onTap: onChangeTap),
              const SizedBox(width: 12),
              ...teamNames.map((name) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _TeamChip(teamName: name),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChangeChip extends StatelessWidget {
  const _ChangeChip({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(MyTeamsCarousel._chipSize / 2),
        child: SizedBox(
          width: MyTeamsCarousel._chipSize,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MyTeamsCarousel._chipSize,
                height: MyTeamsCarousel._chipSize,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.settings,
                  size: 26,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Change',
                style: AppTextStyles.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamChip extends StatelessWidget {
  const _TeamChip({required this.teamName});

  final String teamName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyTeamsCarousel._chipSize,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MyTeamsCarousel._chipSize,
            height: MyTeamsCarousel._chipSize,
            decoration: BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                teamName.isNotEmpty ? teamName[0].toUpperCase() : '?',
                style: AppTextStyles.cardTitle.copyWith(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            teamName,
            style: AppTextStyles.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

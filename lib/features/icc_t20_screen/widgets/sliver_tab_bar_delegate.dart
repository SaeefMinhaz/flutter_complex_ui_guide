import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';

/// Pinned sliver delegate that shows a segment-style [TabBar] below the app bar.
class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  SliverTabBarDelegate(this.controller);

  final TabController controller;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: buildIccT20TabBar(controller: controller),
    );
  }

  static const double _tabBarHeight = 48;

  @override
  double get maxExtent => 8 + _tabBarHeight + 8;

  @override
  double get minExtent => 8 + _tabBarHeight + 8;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

/// Builds the ICC T20 tab bar (Schedule | My games | Statistics) with segment styling.
TabBar buildIccT20TabBar({
  required TabController controller,
}) {
  return TabBar(
    controller: controller,
    tabs: const [
      Tab(text: 'Schedule'),
      Tab(text: 'My games'),
      Tab(text: 'Statistics'),
    ],
    indicator: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(AppRadius.tab),
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: AppColors.onPrimary,
    unselectedLabelColor: AppColors.textSecondary,
    labelStyle: AppTextStyles.tabSelected,
    unselectedLabelStyle: AppTextStyles.tabUnselected,
    dividerHeight: 0,
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  );
}

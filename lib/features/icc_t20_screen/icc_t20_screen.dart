import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/theme.dart';
import '../schedule/presentation/schedule_page.dart';
import '../my_games/presentation/my_games_page.dart';
import '../statistics/presentation/statistics_page.dart';
import 'widgets/header_icon_button.dart';
import 'widgets/sliver_tab_bar_delegate.dart';

/// Main ICC T20 screen: collapsing cover, sticky title, tab bar (F2–F3).
class IccT20Screen extends StatefulWidget {
  const IccT20Screen({super.key});

  @override
  State<IccT20Screen> createState() => _IccT20ScreenState();
}

class _IccT20ScreenState extends State<IccT20Screen>
    with SingleTickerProviderStateMixin {
  static const double _headerExpandedHeight = 220;

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: _headerExpandedHeight,
            pinned: true,
            stretch: true,
            backgroundColor: AppColors.background,
            leading: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: HeaderIconButton(
                icon: Icons.arrow_back,
                onPressed: () => Navigator.of(context).maybePop(),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: HeaderIconButton(
                  icon: Icons.search,
                  onPressed: () {},
                ),
              ),
            ],
            title: Text(
              AppConstants.appTitle,
              style: AppTextStyles.screenTitleSticky,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: _CoverBackground(height: _headerExpandedHeight),
              titlePadding: const EdgeInsets.only(left: 20, bottom: 20),
              centerTitle: false,
              title: Text(
                AppConstants.appTitle,
                style: AppTextStyles.screenTitle,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverTabBarDelegate(_tabController),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: const [
            SchedulePage(),
            MyGamesPage(),
            StatisticsPage(),
          ],
        ),
      ),
    );
  }
}

/// Cover area: gradient placeholder (replace with Image when asset is added).
class _CoverBackground extends StatelessWidget {
  const _CoverBackground({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4C1D95),
              Color(0xFF1E3A8A),
              Color(0xFF0F172A),
            ],
          ),
        ),
      ),
    );
  }
}

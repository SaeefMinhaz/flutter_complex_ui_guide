import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/theme.dart';
import 'widgets/header_icon_button.dart';

/// Main ICC T20 screen with collapsing cover and sticky title (F2). Tabs in F3.
class IccT20Screen extends StatelessWidget {
  const IccT20Screen({super.key});

  static const double _headerExpandedHeight = 220;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
          SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: Center(
                child: Text(
                  'Content – tabs in F3',
                  style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                ),
              ),
            ),
          ),
        ],
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

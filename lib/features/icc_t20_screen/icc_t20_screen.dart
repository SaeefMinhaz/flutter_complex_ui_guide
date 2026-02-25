import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';

/// Main ICC T20 screen (collapsing header + tabs). To be implemented in F2–F3.
class IccT20Screen extends StatelessWidget {
  const IccT20Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppConstants.appTitle)),
      body: const Center(child: Text('ICC T20 screen – F2/F3')),
    );
  }
}

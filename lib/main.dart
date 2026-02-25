import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'features/icc_t20_screen/icc_t20_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICC T20',
      theme: AppTheme.light,
      home: const IccT20Screen(),
    );
  }
}

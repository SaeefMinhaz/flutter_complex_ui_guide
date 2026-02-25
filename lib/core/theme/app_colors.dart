import 'package:flutter/material.dart';

/// ICC T20 UI color palette (active tab/date: blue; inactive: grey; cards: white).
abstract final class AppColors {
  AppColors._();

  // Primary – active tab, selected date, accents
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryDark = Color(0xFF1D4ED8);

  // Backgrounds
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFF1F5F9);

  // Text
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textInactive = Color(0xFF94A3B8);

  // On primary (e.g. text on blue tab)
  static const Color onPrimary = Color(0xFFFFFFFF);

  // Status / indicators
  static const Color liveIndicator = Color(0xFFDC2626);
  static const Color eventDot = Color(0xFF22C55E);

  // Header / overlay buttons (back, search)
  static const Color headerButtonBg = Color(0x80000000);
  static const Color headerButtonIcon = Color(0xFFFFFFFF);
}

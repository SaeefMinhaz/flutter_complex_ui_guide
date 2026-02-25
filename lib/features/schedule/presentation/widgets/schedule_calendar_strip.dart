import 'package:flutter/material.dart';

import 'date_card.dart';

/// Horizontal scrollable strip of [DateCard]s. Manages selected index locally (F9 can wire Bloc).
class ScheduleCalendarStrip extends StatefulWidget {
  const ScheduleCalendarStrip({
    super.key,
    required this.dates,
    this.initialSelectedIndex = 0,
    this.eventDotDateIndices,
    this.onDateSelected,
  });

  final List<DateTime> dates;
  final int initialSelectedIndex;
  /// Indices of dates that show the green event dot (e.g. has events).
  final Set<int>? eventDotDateIndices;
  final ValueChanged<DateTime>? onDateSelected;

  @override
  State<ScheduleCalendarStrip> createState() => _ScheduleCalendarStripState();
}

class _ScheduleCalendarStripState extends State<ScheduleCalendarStrip> {
  late int _selectedIndex;

  static const List<String> _monthNames = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialSelectedIndex.clamp(0, widget.dates.length - 1);
  }

  @override
  void didUpdateWidget(covariant ScheduleCalendarStrip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSelectedIndex != widget.initialSelectedIndex ||
        oldWidget.dates != widget.dates) {
      _selectedIndex = widget.initialSelectedIndex.clamp(0, widget.dates.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dates.isEmpty) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 88,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: widget.dates.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final d = widget.dates[index];
          final isSelected = index == _selectedIndex;
          final showDot = widget.eventDotDateIndices?.contains(index) ?? false;
          return DateCard(
            day: d.day,
            month: _monthNames[d.month - 1],
            isSelected: isSelected,
            showEventDot: showDot,
            onTap: () {
              setState(() => _selectedIndex = index);
              widget.onDateSelected?.call(d);
            },
          );
        },
      ),
    );
  }
}

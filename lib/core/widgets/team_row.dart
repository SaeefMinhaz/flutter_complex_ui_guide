import 'package:flutter/material.dart';

import '../theme/theme.dart';

/// One row: leading (e.g. flag), team name, trailing text (score or "VS").
class TeamRow extends StatelessWidget {
  const TeamRow({
    super.key,
    required this.teamName,
    required this.trailingText,
    this.leading,
    this.trailingStyle,
  });

  final String teamName;
  final String trailingText;
  final Widget? leading;
  final TextStyle? trailingStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leading != null) ...[
          SizedBox(width: 24, height: 24, child: leading),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            teamName,
            style: AppTextStyles.body,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          trailingText,
          style: trailingStyle ?? AppTextStyles.score,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

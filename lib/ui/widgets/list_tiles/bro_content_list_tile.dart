// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/models/ui/themes/bro_specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This is a list tile used to display content in the application.
class BroContentListTile extends StatelessWidget {
  /// {@template BroContentListTile.title}
  /// The title of the list tile.
  /// {@endtemplate}
  final String title;

  /// {@template BroContentListTile.subtitle}
  /// The subtitle of the list tile.
  /// {@endtemplate}
  final String subtitle;

  /// This is the widget displayed at the end of the list tile.
  ///
  /// If null, no widget is displayed.
  final Widget? trailing;

  /// The vertical alignment of the content of the list tile.
  final CrossAxisAlignment verticalContentAlignment;

  /// Whether the list tile is enabled or not. If false, the colors of the list tile will be
  /// modified to indicate that the list tile is disabled.
  final bool enabled;

  /// Class constructor
  const BroContentListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.verticalContentAlignment = CrossAxisAlignment.center,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final actExt = themeData.extension<BroSpecificColors>()!;

    return Row(
      crossAxisAlignment: verticalContentAlignment,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: themeData.textTheme.titleSmall?.copyWith(
                  color: _applyDisabledColorIfNeeded(
                    actExt: actExt,
                    color: themeData.colorScheme.onSurface,
                  ),
                ),
              ),
              SizedBox(height: 6.w),
              Text(
                subtitle,
                style: themeData.textTheme.bodyMedium?.copyWith(
                  color: _applyDisabledColorIfNeeded(
                    actExt: actExt,
                    color: themeData.colorScheme.outline,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        if (trailing != null) ...[SizedBox(width: 12.w), trailing!],
      ],
    );
  }

  /// This method is used to apply the disabled color to the given color if the list tile is
  /// disabled.
  Color _applyDisabledColorIfNeeded({required BroSpecificColors actExt, required Color color}) =>
      enabled ? color : actExt.getDisabledColor(color);
}

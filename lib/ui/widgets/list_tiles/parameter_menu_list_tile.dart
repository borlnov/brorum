// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/constants/graphical_constants.dart' as graphical_constants;
import 'package:brorum/models/ui/themes/bro_specific_colors.dart';
import 'package:brorum/ui/widgets/list_tiles/bro_content_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This is a list tile used to represent a menu parameter
class ParameterMenuListTile extends StatelessWidget {
  /// The icon of the list tile.
  final IconData icon;

  /// {@macro BroContentListTile.title}
  final String title;

  /// {@macro BroContentListTile.subtitle}
  final String subtitle;

  /// The callback called when the user taps on the list tile.
  final VoidCallback? onTap;

  /// Class constructor
  const ParameterMenuListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final actExt = themeData.extension<BroSpecificColors>()!;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: graphical_constants.mainHorizontalPadding.w,
          vertical: 10.w,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 24.w,
                color: _applyDisabledColorIfNeeded(
                  actExt: actExt,
                  color: themeData.colorScheme.primary,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: BroContentListTile(
                  title: title,
                  subtitle: subtitle,
                  enabled: onTap != null,
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16.w,
                    color: _applyDisabledColorIfNeeded(
                      actExt: actExt,
                      color: themeData.colorScheme.outline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// This method is used to apply the disabled color to the given color if the list tile is
  /// disabled (onTap is null).
  Color _applyDisabledColorIfNeeded({required BroSpecificColors actExt, required Color color}) =>
      onTap == null ? actExt.getDisabledColor(color) : color;
}

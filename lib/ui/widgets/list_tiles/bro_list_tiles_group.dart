// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_dart_utility/act_dart_utility.dart';
import 'package:brorum/constants/graphical_constants.dart' as graphical_constants;
import 'package:brorum/models/ui/themes/bro_specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This widget is used to group list tiles together with a title and a divider between them.
class BroListTilesGroup extends StatelessWidget {
  /// The title of the group
  final String title;

  /// The children of the group
  final List<Widget> children;

  /// Whether to display a divider between the list tiles or not. If false, no divider is displayed.
  final bool displayDivider;

  /// Class constructor
  const BroListTilesGroup({
    super.key,
    required this.title,
    required this.children,
    this.displayDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final actExt = themeData.extension<BroSpecificColors>()!;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: graphical_constants.mainHorizontalPadding.w,
              right: graphical_constants.mainHorizontalPadding.w,
              top: 12.w,
              bottom: 20.w,
            ),
            child: Text(
              title,
              style: themeData.textTheme.titleSmall?.copyWith(color: themeData.colorScheme.primary),
            ),
          ),
          ..._buildChildrenWithDividers(themeData: themeData, actExt: actExt),
        ],
      ),
    );
  }

  /// This method returns the children of the group with dividers between them if [displayDivider]
  /// is true.
  List<Widget> _buildChildrenWithDividers({
    required ThemeData themeData,
    required BroSpecificColors actExt,
  }) {
    if (!displayDivider) {
      return children;
    }

    return ListUtility.interleave(
      children,
      Divider(
        height: 1.h,
        thickness: 1.h,
        color: actExt.getDisabledColor(themeData.colorScheme.outline),
      ),
      addLeft: true,
      addRight: true,
    );
  }
}

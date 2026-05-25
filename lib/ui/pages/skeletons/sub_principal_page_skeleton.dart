// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/constants/graphical_constants.dart' as graphical_constants;
import 'package:brorum/generated/l10n.dart';
import 'package:brorum/types/ui/principal_sub_page_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This is the skeleton of the sub pages of the principal page.
class SubPrincipalPageSkeleton extends StatelessWidget {
  /// The type of the sub page to display.
  final PrincipalSubPageTypes subPageType;

  /// Page child to display when the sub page is loading.
  final Widget child;

  /// Class constructor
  const SubPrincipalPageSkeleton({super.key, required this.subPageType, required this.child});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final tr = Tr.of(context);

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: graphical_constants.mainHorizontalPadding.w,
          ),
          color: themeData.primaryColor,
          child: Text(
            subPageType.getPageName(tr: tr),
            style: themeData.textTheme.headlineSmall?.copyWith(
              color: themeData.colorScheme.onPrimary,
            ),
          ),
        ),
        Expanded(child: SingleChildScrollView(child: child)),
      ],
    );
  }
}

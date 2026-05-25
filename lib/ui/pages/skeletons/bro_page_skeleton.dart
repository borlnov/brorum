// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/constants/graphical_constants.dart' as graphical_constants;
import 'package:brorum/ui/widgets/app_bars/bro_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This is the skeleton of the bro pages of the application (other than the principal page and sub
/// pages).
class BroPageSkeleton extends StatelessWidget {
  /// {@macro BroAppBar.title}
  final String appBarTitle;

  /// The content padding to apply to the child of the page. If null, a default padding will be
  /// applied.
  final EdgeInsets? contentPadding;

  /// Page child to display
  final Widget child;

  /// Class constructor
  const BroPageSkeleton({
    super.key,
    required this.appBarTitle,
    required this.child,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: BroAppBar.builder(context: context, title: appBarTitle),
    body: Padding(
      padding:
          contentPadding ??
          EdgeInsets.only(
            left: graphical_constants.mainHorizontalPadding.w,
            right: graphical_constants.mainHorizontalPadding.w,
            top: 20.h,
          ),
      child: child,
    ),
  );
}

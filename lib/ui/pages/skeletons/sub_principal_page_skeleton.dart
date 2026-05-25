// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/generated/l10n.dart';
import 'package:brorum/types/ui/principal_sub_page_types.dart';
import 'package:brorum/ui/widgets/app_bars/bro_app_bar.dart';
import 'package:flutter/material.dart';

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
    final tr = Tr.of(context);

    return Column(
      children: [
        BroAppBar.builder(
          context: context,
          title: subPageType.getPageName(tr: tr),
        ),
        Expanded(child: SingleChildScrollView(child: child)),
      ],
    );
  }
}

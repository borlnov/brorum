// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/constants/graphical_constants.dart' as graphical_constants;
import 'package:brorum/ui/widgets/list_tiles/bro_content_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This is a tile which displays a text and a switch on the right of it.
class BroSwitchListTile extends StatelessWidget {
  /// {@macro BroContentListTile.title}
  final String title;

  /// {@macro BroContentListTile.subtitle}
  final String subtitle;

  /// The value of the switch.
  final bool value;

  /// The callback to call when the switch is toggled.
  final ValueChanged<bool>? onChanged;

  /// Class constructor
  const BroSwitchListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(
      horizontal: graphical_constants.mainHorizontalPadding.w,
      vertical: 10.w,
    ),
    child: BroContentListTile(
      title: title,
      subtitle: subtitle,
      verticalContentAlignment: CrossAxisAlignment.start,
      enabled: onChanged != null,
      trailing: Switch(value: value, onChanged: onChanged),
    ),
  );
}

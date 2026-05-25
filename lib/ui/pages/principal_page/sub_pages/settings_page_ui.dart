// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/generated/l10n.dart';
import 'package:brorum/types/ui/principal_sub_page_types.dart';
import 'package:brorum/ui/pages/skeletons/sub_principal_page_skeleton.dart';
import 'package:brorum/ui/widgets/list_tiles/parameter_list_tile.dart';
import 'package:brorum/ui/widgets/list_tiles/parameters_list_group.dart';
import 'package:flutter/material.dart';

/// This is the UI of the settings page of the application.
class SettingsPageUI extends StatelessWidget {
  /// Class constructor
  const SettingsPageUI({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final tr = Tr.of(context);

    return SubPrincipalPageSkeleton(
      subPageType: PrincipalSubPageTypes.settings,
      child: Column(
        children: [
          ParametersListGroup(
            title: '(TR) Appearance',
            children: [
              ParameterListTile(
                icon: Icons.palette,
                title: '(TR) Theme',
                subtitle: '(TR) Select the theme of the application',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

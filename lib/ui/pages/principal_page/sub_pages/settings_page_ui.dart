// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_global_manager/act_global_manager.dart';
import 'package:brorum/generated/l10n.dart';
import 'package:brorum/managers/routes/bro_routes_manager.dart';
import 'package:brorum/types/routes/bro_routes.dart';
import 'package:brorum/types/ui/principal_sub_page_types.dart';
import 'package:brorum/ui/pages/skeletons/sub_principal_page_skeleton.dart';
import 'package:brorum/ui/widgets/list_tiles/bro_list_tiles_group.dart';
import 'package:brorum/ui/widgets/list_tiles/parameter_menu_list_tile.dart';
import 'package:flutter/material.dart';

/// This is the UI of the settings page of the application.
class SettingsPageUI extends StatelessWidget {
  /// Class constructor
  const SettingsPageUI({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = Tr.of(context);

    return SubPrincipalPageSkeleton(
      subPageType: PrincipalSubPageTypes.settings,
      child: Column(
        children: [
          BroListTilesGroup(
            title: tr.settingsAppearanceSectionTitle,
            children: [
              ParameterMenuListTile(
                icon: Icons.palette,
                title: tr.settingsThemeTitle,
                subtitle: tr.settingsThemeSubtitle,
                onTap: () => globalGetIt().get<BroRoutesManager>().push(BroRoutes.themesSettings),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

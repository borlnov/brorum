// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_router_manager/act_router_manager.dart';
import 'package:brorum/types/routes/bro_routes.dart';
import 'package:brorum/ui/pages/principal_page/principal_page_ui.dart';
import 'package:brorum/ui/pages/settings/themes/themes_settings_page_ui.dart';
import 'package:flutter/material.dart';

/// Helper class for managing route names in the application.
class RoutesNameHelper extends AbstractRoutesHelper<BroRoutes> {
  /// Class constructor for [RoutesNameHelper].
  RoutesNameHelper({required super.initialRoute, required super.logsHelper})
    : super(
        values: BroRoutes.values,
        defaultOrientation: ScreenOrientationOption.mayRotate,
        errorRoute: BroRoutes.error,
        debugLogDiagnostics: true,
      ) {
    onPage(BroRoutes.error, _createHomePage);
    onPage(BroRoutes.principal, _createHomePage);
    onPage(BroRoutes.themesSettings, _createThemesSettingsPage);
  }

  /// Callback to create the [PrincipalPageUI]
  RoutePageDetails _createHomePage(BuildContext context, GoRouterState state) =>
      const RoutePageDetails(widget: PrincipalPageUI());

  /// Callback to create the themes settings page.
  RoutePageDetails _createThemesSettingsPage(BuildContext context, GoRouterState state) =>
      const RoutePageDetails(widget: ThemesSettingsPageUi());
}

// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/generated/l10n.dart';
import 'package:brorum/types/ui/principal_sub_page_types.dart';
import 'package:brorum/ui/pages/principal_page/principal_page_bloc.dart';
import 'package:brorum/ui/pages/principal_page/principal_page_events.dart';
import 'package:brorum/ui/pages/principal_page/principal_page_state.dart';
import 'package:brorum/ui/pages/principal_page/sub_pages/settings_page_ui.dart';
import 'package:brorum/ui/widgets/bottom_navigation_bar/bro_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This is the principal page of the application. It displays the main content of the application
/// and allows the user to navigate to different sub pages.
class PrincipalPageUI extends StatelessWidget {
  /// Class constructor
  const PrincipalPageUI({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final tr = Tr.of(context);

    return BlocProvider<PrincipalPageBloc>(
      create: (context) => PrincipalPageBloc(),
      child: BlocBuilder<PrincipalPageBloc, PrincipalPageState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<PrincipalPageBloc>(context);

          return Scaffold(
            body: _buildPage(
              themeData: themeData,
              tr: tr,
              state: state,
              selectedPageType: state.selectedSubPage,
            ),
            bottomNavigationBar: BroBottomNavigationBar(
              selectedType: state.selectedSubPage,
              onItemSelected: (value) =>
                  bloc.add(PrincipalSubPageUpdatedEvent(newSelectedSubPage: value)),
            ),
          );
        },
      ),
    );
  }

  /// Called to build the page of the principal page.
  Widget _buildPage({
    required ThemeData themeData,
    required Tr tr,
    required PrincipalPageState state,
    required PrincipalSubPageTypes selectedPageType,
  }) => switch (selectedPageType) {
    PrincipalSubPageTypes.home => _buildHomeSubPage(themeData: themeData, tr: tr, state: state),
    PrincipalSubPageTypes.settings => _buildSettingsSubPage(
      themeData: themeData,
      tr: tr,
      state: state,
    ),
  };

  /// Called to build the home sub page of the principal page.
  Widget _buildHomeSubPage({
    required ThemeData themeData,
    required Tr tr,
    required PrincipalPageState state,
  }) => Center(child: Text("(TR) Home Sub Page"));

  /// Called to build the settings sub page of the principal page.
  Widget _buildSettingsSubPage({
    required ThemeData themeData,
    required Tr tr,
    required PrincipalPageState state,
  }) => const SettingsPageUI();
}

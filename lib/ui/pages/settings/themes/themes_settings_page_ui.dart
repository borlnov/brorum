// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_themes_manager/act_themes_manager.dart';
import 'package:brorum/generated/l10n.dart';
import 'package:brorum/types/themes/bro_themes.dart';
import 'package:brorum/ui/pages/settings/themes/themes_settings_page_bloc.dart';
import 'package:brorum/ui/pages/settings/themes/themes_settings_page_state.dart';
import 'package:brorum/ui/pages/skeletons/bro_page_skeleton.dart';
import 'package:brorum/ui/widgets/list_tiles/bro_list_tiles_group.dart';
import 'package:brorum/ui/widgets/list_tiles/bro_switch_list_tile.dart';
import 'package:brorum/ui/widgets/radios/themes/themes_radio_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This is the UI of the themes settings page of the application.
class ThemesSettingsPageUi extends StatelessWidget {
  /// Class constructor
  const ThemesSettingsPageUi({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = Tr.of(context);

    return BroPageSkeleton(
      appBarTitle: tr.themesSettingsUiTitle,
      contentPadding: EdgeInsets.only(top: 20.h),
      child: BlocProvider<ThemesSettingsPageBloc>(
        create: (context) => ThemesSettingsPageBloc(),
        child: BlocBuilder<ThemesSettingsPageBloc, ThemesSettingsPageState>(
          builder: (context, state) {
            final bloc = BlocProvider.of<ThemesSettingsPageBloc>(context);

            return Column(
              children: [
                BroListTilesGroup(
                  title: tr.darkModeThemesSectionTitle,
                  children: [
                    BroSwitchListTile(
                      title: tr.settingsSystemBrightnessTitle,
                      subtitle: tr.settingsSystemBrightnessSubtitle,
                      value: state.brightness == null,
                      onChanged: (value) {
                        bloc.add(
                          AskToUpdateBrightnessEvent(
                            newBrightness: value ? null : MediaQuery.of(context).platformBrightness,
                          ),
                        );
                      },
                    ),
                    BroSwitchListTile(
                      title: tr.settingsDarkModeTitle,
                      subtitle: tr.settingsDarkModeSubtitle,
                      value: state.brightness == Brightness.dark,
                      onChanged: (state.brightness != null)
                          ? (value) {
                              bloc.add(
                                AskToUpdateBrightnessEvent(
                                  newBrightness: value ? Brightness.dark : Brightness.light,
                                ),
                              );
                            }
                          : null,
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                BroListTilesGroup(
                  title: tr.themeSectionTitle,
                  displayDivider: false,
                  children: [
                    ThemesRadioGroup(
                      currentBrightness:
                          state.brightness ?? MediaQuery.of(context).platformBrightness,
                      selectedTheme: state.currentTheme as BroThemes,
                      onChanged: (newTheme) => bloc.add(AskToUpdateThemeEvent(newTheme: newTheme)),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

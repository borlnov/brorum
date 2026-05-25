// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/generated/l10n.dart';

/// This represents the different types of sub pages that can be displayed in the principal page.
enum PrincipalSubPageTypes {
  /// This is the sub page that displays the home page of the application.
  home,

  /// This is the sub page that displays the settings page of the application.
  settings;

  /// This method returns the name of the sub page type in the current language.
  String getPageName({required Tr tr}) => switch (this) {
    PrincipalSubPageTypes.home => "(TR) Home",
    PrincipalSubPageTypes.settings => "(TR) Settings",
  };
}

// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/generated/l10n.dart';
import 'package:brorum/types/ui/principal_sub_page_types.dart';
import 'package:flutter/material.dart';

/// This is the bottom navigation bar of the application. It allows the user to navigate to
/// different sub pages of the principal page.
class BroBottomNavigationBar extends StatelessWidget {
  /// The index of the currently selected item in the bottom navigation bar.
  final PrincipalSubPageTypes selectedType;

  /// Called when the user selects a new item in the bottom navigation bar. The type of the
  /// selected item is passed as a parameter.
  final ValueChanged<PrincipalSubPageTypes>? onItemSelected;

  /// Class constructor
  const BroBottomNavigationBar({super.key, required this.selectedType, this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final tr = Tr.of(context);

    return BottomNavigationBar(
      currentIndex: selectedType.index,
      onTap: (value) => onItemSelected?.call(PrincipalSubPageTypes.values[value]),
      items: _buildItems(themeData: themeData, tr: tr),
    );
  }

  /// This method is called to build the list of items to display in the bottom navigation bar. It
  /// iterates over the different sub page types and builds an item for each type.
  List<BottomNavigationBarItem> _buildItems({required ThemeData themeData, required Tr tr}) {
    final items = <BottomNavigationBarItem>[];

    for (final type in PrincipalSubPageTypes.values) {
      final item = _buildItem(themeData: themeData, tr: tr, type: type);
      items.add(item);
    }

    return items;
  }

  /// Called to build a bottom navigation bar item for a given sub page type.
  BottomNavigationBarItem _buildItem({
    required ThemeData themeData,
    required Tr tr,
    required PrincipalSubPageTypes type,
  }) => switch (type) {
    PrincipalSubPageTypes.home => BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '(TR) Home',
    ),
    PrincipalSubPageTypes.settings => BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: '(TR) Settings',
    ),
  };
}

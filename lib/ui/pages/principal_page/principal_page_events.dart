// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_flutter_utility/act_flutter_utility.dart';
import 'package:brorum/types/ui/principal_sub_page_types.dart';

/// Emitted when the user selects a new sub page in the principal page.
class PrincipalSubPageUpdatedEvent extends BlocEventForMixin {
  /// The new selected sub page type.
  final PrincipalSubPageTypes newSelectedSubPage;

  /// Class constructor
  const PrincipalSubPageUpdatedEvent({required this.newSelectedSubPage});

  /// {@macro act_flutter_utility.BlocEventForMixin.props}
  @override
  List<Object?> get props => [...super.props, newSelectedSubPage];
}

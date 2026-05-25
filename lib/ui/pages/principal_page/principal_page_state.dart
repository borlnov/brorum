// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_flutter_utility/act_flutter_utility.dart';
import 'package:brorum/types/ui/principal_sub_page_types.dart';

/// This class represents the state of the principal page. It contains the index of the currently
/// selected sub page.
class PrincipalPageState extends BlocStateForMixin<PrincipalPageState> {
  /// The type of the currently selected sub page.
  final PrincipalSubPageTypes selectedSubPage;

  /// Class constructor
  const PrincipalPageState({required this.selectedSubPage});

  /// Initial state of the principal page.
  const PrincipalPageState.init() : selectedSubPage = PrincipalSubPageTypes.home;

  /// {@macro act_flutter_utility.BlocStateForMixin.copyWith}
  @override
  PrincipalPageState copyWith({PrincipalSubPageTypes? selectedSubPage}) =>
      PrincipalPageState(selectedSubPage: selectedSubPage ?? this.selectedSubPage);

  /// This method is a convenient way to copy the state of the principal page with a new selected
  /// sub page type.
  PrincipalPageState copyWithSubPageType({required PrincipalSubPageTypes selectedSubPage}) =>
      copyWith(selectedSubPage: selectedSubPage);

  /// {@macro act_flutter_utility.BlocStateForMixin.props}
  @override
  List<Object?> get props => [...super.props, selectedSubPage];
}

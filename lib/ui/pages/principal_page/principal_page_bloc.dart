// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_flutter_utility/act_flutter_utility.dart';
import 'package:brorum/ui/pages/principal_page/principal_page_events.dart';
import 'package:brorum/ui/pages/principal_page/principal_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This is the bloc for the principal page. It manages the state of the principal page and allows
/// the user to navigate to different sub pages.
class PrincipalPageBloc extends BlocForMixin<PrincipalPageState> {
  /// Class constructor
  PrincipalPageBloc() : super(const PrincipalPageState.init());

  /// {@macro act_flutter_utility.BlocForMixin.registerMixinEvents}
  @override
  void registerMixinEvents() {
    super.registerMixinEvents();

    on<PrincipalSubPageUpdatedEvent>(_onPrincipalSubPageUpdatedEvent);
  }

  /// This method is called when the user selects a new sub page in the principal page. It updates
  /// the state of the principal page with the new selected sub page index.
  Future<void> _onPrincipalSubPageUpdatedEvent(
    PrincipalSubPageUpdatedEvent event,
    Emitter<PrincipalPageState> emit,
  ) async {
    emit(state.copyWithSubPageType(selectedSubPage: event.newSelectedSubPage));
  }
}

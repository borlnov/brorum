// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_themes_manager/act_themes_manager.dart';
import 'package:flutter/material.dart';

/// This class is used to define the specific colors of the application that are not defined in the
/// color scheme of the theme.
class BroSpecificColors extends AbsAppSpecificColors<BroSpecificColors> {
  /// The warning color of the application.
  final Color warning;

  /// The on warning color of the application.
  final Color onWarning;

  /// The success color of the application.
  final Color success;

  /// The on success color of the application.
  final Color onSuccess;

  /// Class constructor
  const BroSpecificColors({
    required this.warning,
    required this.onWarning,
    required this.success,
    required this.onSuccess,
  });

  /// Implement the copyWith method to create a copy of the BroSpecificColors with some values
  @override
  BroSpecificColors copyWith({
    Color? warning,
    Color? onWarning,
    Color? success,
    Color? onSuccess,
  }) => BroSpecificColors(
    warning: warning ?? this.warning,
    onWarning: onWarning ?? this.onWarning,
    success: success ?? this.success,
    onSuccess: onSuccess ?? this.onSuccess,
  );

  /// Implement the lerp method to interpolate between two BroSpecificColors
  @override
  BroSpecificColors lerp(ThemeExtension<BroSpecificColors>? other, double t) {
    if (other is! BroSpecificColors) {
      return this;
    }

    return BroSpecificColors(
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      onWarning: Color.lerp(onWarning, other.onWarning, t) ?? onWarning,
      success: Color.lerp(success, other.success, t) ?? success,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t) ?? onSuccess,
    );
  }
}

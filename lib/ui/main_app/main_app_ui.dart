// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_flutter_utility/act_flutter_utility.dart';
import 'package:act_global_manager/act_global_manager.dart';
import 'package:act_intl/act_intl.dart';
import 'package:act_platform_manager/act_platform_manager.dart';
import 'package:brorum/constants/graphical_constants.dart' as graphical_constants;
import 'package:brorum/generated/l10n.dart';
import 'package:brorum/managers/bro_config_manager.dart';
import 'package:brorum/managers/bro_global_manager.dart';
import 'package:brorum/managers/routes/bro_routes_manager.dart';
import 'package:brorum/ui/main_app/main_app_bloc.dart';
import 'package:brorum/ui/main_app/main_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This is the Main widget for the application
class MainAppUi extends StatelessWidget {
  /// Class constructor
  const MainAppUi({super.key});

  @override
  Widget build(BuildContext context) {
    final router = globalGetIt().get<BroRoutesManager>().router;
    final platformManager = globalGetIt().get<PlatformManager>();

    return LocalesObserverWidget(
      child: ScreenUtilInit(
        designSize: graphical_constants.mockUpSize,
        minTextAdapt: !platformManager.isDesktop,
        enableScaleText: () => !platformManager.isDesktop,
        enableScaleWH: () => !platformManager.isDesktop,
        builder: (context, child) => BlocProvider(
          create: (context) => MainAppBloc(),
          child: BlocBuilder<MainAppBloc, MainAppState>(
            builder: (context, state) => MaterialApp.router(
              // The app title is the one displayed in the window title bar
              onGenerateTitle: (context) => Tr.of(context).appTitle,
              routerConfig: router,
              themeMode: state.themeMode,
              theme: state.currentTheme.themeData.lightThemeData,
              darkTheme: state.currentTheme.themeData.darkThemeData,
              locale: state.wantedLocale,
              localizationsDelegates: const [
                Tr.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: Tr.delegate.supportedLocales,
              builder: (context, child) {
                BroGlobalManager.instance.initInFirstView(context);

                return EnvBanner.displayAppBarBanner<BroConfigManager>(child: child ?? Container());
              },
            ),
          ),
        ),
      ),
    );
  }
}

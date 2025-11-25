import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talamiz_arina/core/app_cubit/app_cubit_cubit.dart';
import 'package:talamiz_arina/core/layout/mobile_layout_screen/mobile_layout_screen.dart';
import 'package:talamiz_arina/core/layout/select_layout_screen.dart';
import 'package:talamiz_arina/core/layout/tablet_layout_screen/tablet_layout_screen.dart.dart';
import 'package:talamiz_arina/core/layout/web_layout_screen/web_layout_screen.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TalamizArena extends StatelessWidget {
  const TalamizArena({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    //   [
    //     DeviceOrientation.portraitUp,
    //   ],
    // );
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarBrightness: Brightness.light,
    //     statusBarIconBrightness: Brightness.dark,
    //     statusBarColor: Colors.transparent,
    //   ),
    // );

    return BlocProvider(
      create: (context) => AppCubit(),
      child: SelectLayoutSCreen(
        mobileBuilder: (context) => const MobileLayOut(),
        tabletBuilder: (context) => const TabletLayOut(),
        webBuilder: (context) => const WebLayOut(),
      ),
    );
  }
}

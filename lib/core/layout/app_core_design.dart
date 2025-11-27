import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:talamiz_arina/core/app_cubit/app_cubit_cubit.dart';
import 'package:talamiz_arina/core/app_cubit/app_cubit_state.dart';
import 'package:talamiz_arina/core/l10n/app_localizations.dart';
import 'package:talamiz_arina/core/routes/page_routes.dart';
import 'package:talamiz_arina/core/themes/theme/custom_theme.dart';

class ApplicationDesign extends StatelessWidget {
  const ApplicationDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        // final controller = BlocProvider.of<AppCubit>(context);
        return ThemeProvider(
          duration: const Duration(milliseconds: 1000),
          initTheme: ThemeData.light(),
          builder: (context, theme) => MaterialApp.router(
            routerConfig: PageRoutes.router,
            // title: kAppName,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            builder: (context, child) {
              Intl.defaultLocale = Localizations.localeOf(context).toString();
              return child!;
            },
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:talamiz_arina/core/routes/page_routes.dart';
// import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

// class TalamizArena extends StatelessWidget {
//   const TalamizArena({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       locale: const Locale("ar"),
//       supportedLocales: const [Locale('ar')],
//       localizationsDelegates: const [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       routerConfig: PageRoutes.router,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(
//           backgroundColor: Colors.white,
//           toolbarHeight: 80,
//           scrolledUnderElevation: 0,
//           titleTextStyle: AppTextStyle.font20SemiBold.copyWith(
//             color: Colors.black,
//             fontFamily: 'sf-arabic-rounded',
//           ),
//         ),
//         fontFamily: 'sf-arabic-rounded',
//         scaffoldBackgroundColor: Colors.white,
//       ),
//     );
//   }
// }

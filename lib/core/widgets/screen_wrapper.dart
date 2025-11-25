import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    this.applayAnotation = true,
    super.key,
    required this.body,
    this.statusAppBarColor,
    this.backGroundColor,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar,
    this.floatingActionButton,
    this.canPop,
    this.appBar,
    this.bottomNavigationBar,
    this.onPopInvoked,
    this.drawer,
    this.backgroundImage,
    this.topSafeArea,
    this.maxWidth,
  });

  final Widget body;
  final Color? statusAppBarColor;
  final Color? backGroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool? extendBodyBehindAppBar, topSafeArea;
  final Widget? floatingActionButton, drawer;
  final bool? canPop, applayAnotation;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final PopInvokedWithResultCallback<bool>? onPopInvoked;
  final DecorationImage? backgroundImage;
   final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop ?? true,
      onPopInvokedWithResult: onPopInvoked,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1)),
          child: Scaffold(
            
            // extendBody: true,
            backgroundColor: backGroundColor ?? MyColors.darkBlueNormal,
            drawer: drawer,
            bottomNavigationBar: bottomNavigationBar,
            appBar: appBar,
            floatingActionButton: floatingActionButton,
            extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
            body: applayAnotation!
                ? AnnotatedRegion(
                    value: const SystemUiOverlayStyle(
                      statusBarBrightness: Brightness.light,
                      statusBarIconBrightness: Brightness.light,
                    ),
                    child: SafeArea(
                      top: topSafeArea ?? false,
                      left: false,
                      bottom: false,
                      right: false,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth:
                                maxWidth ?? MediaQuery.of(context).size.width,
                          ),
                          child: body,
                        ),
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.topCenter,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: maxWidth ?? MediaQuery.of(context).size.width,
                      ),
                      child: body,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

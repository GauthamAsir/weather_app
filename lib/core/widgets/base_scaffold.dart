import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/themes/fonts_custom.dart';

import '../utils/base_notifier.dart';

final baseNotifierProvider =
    ChangeNotifierProvider.autoDispose<BaseNotifier>((ref) => BaseNotifier());

class BaseScaffold extends ConsumerWidget {
  final Widget body;
  final Widget? bottom;
  final bool? resizeToAvoidBottomInset;
  final List<Widget>? actionMenu;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool safeAreaTop, safeAreaBottom;
  final bool changeStatusBarColor;

  const BaseScaffold(
      {super.key,
      required this.body,
      this.bottom,
      this.resizeToAvoidBottomInset,
      this.actionMenu,
      this.backgroundColor,
      this.appBar,
      this.drawer,
      this.scaffoldKey,
      this.floatingActionButton,
      this.floatingActionButtonAnimator,
      this.floatingActionButtonLocation,
      this.safeAreaTop = true,
      this.safeAreaBottom = true,
      this.changeStatusBarColor = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    if (changeStatusBarColor) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:
            backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarColor:
            backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    }

    var baseProvider = ref.watch(baseNotifierProvider);
    bool isConnected = baseProvider.isConnected;

    return Scaffold(
        key: scaffoldKey,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        endDrawerEnableOpenDragGesture: false,
        // bottomSheet: bottom,
        drawer: drawer,
        bottomNavigationBar: bottom,
        floatingActionButton: floatingActionButton,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
        floatingActionButtonLocation: floatingActionButtonLocation,
        body: SafeArea(
            top: safeAreaTop,
            bottom: safeAreaBottom,
            child: (isConnected)
                ? body
                : _noInternet(retry: () {
                    baseProvider.checkConnectionState();
                  })),
        appBar: appBar);
  }

  Widget _noInternet({required VoidCallback retry}) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Please check your internet connection",
            style: TextStyle(fontSize: FontSizes.s18),
          ),
          ElevatedButton(
            onPressed: retry,
            child: const Text('Retry'),
          ),
        ],
      ),
    ));
  }
}

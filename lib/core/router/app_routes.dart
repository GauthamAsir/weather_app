import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/themes/app_colors.dart';

class AppRouter {
  ///Navigator key to navigate between pages
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  ///Scaffold messenger key to show snackbars
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  ///Shows a loading dialog with a default loading message as 'Loading'
  ///
  ///[text] is the message to be shown in the dialog
  static Future<T?> showLoadingDialog<T>([String text = 'Loading']) async {
    return showDialog<T>(
      context: navigatorKey.currentState!.overlay!.context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Builder(
            builder: (context) {
              final size = MediaQuery.of(context).size;
              return Container(
                height: size.height * 0.1,
                width: size.width * 0.2,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircularProgressIndicator(),
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  ///Shows a snackbar with a default title as 'Error'
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?
      showErrorSnackbar([String message = 'Error..']) {
    return scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        elevation: 1,
        padding: EdgeInsets.zero,
        content: Row(
          children: [
            Container(
              height: 56.h,
              width: 5.w,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(6.r)),
              ),
            ),
            SizedBox(
              width: 24.w,
            ),
            Icon(
              Icons.cancel,
              size: 24.sp,
              color: Colors.red,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              message,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
            IconButton(
              onPressed: () {
                scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
              },
              icon: Icon(
                Icons.close,
                color: Colors.grey.withOpacity(.6),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.06),
          ),
        ),
      ),
    );
  }

  ///Shows a snackbar with a default title as 'Success'
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?
      showSuccessSnackbar([String message = 'Success']) {
    return scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        elevation: 1,
        padding: EdgeInsets.zero,
        content: Row(
          children: [
            Container(
              height: 56.h,
              width: 6.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(6.r)),
              ),
            ),
            SizedBox(
              width: 24.w,
            ),
            Icon(
              Icons.check_circle,
              size: 24.sp,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              message,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
              },
              icon: Icon(
                Icons.close,
                color: Colors.grey.withOpacity(0.6),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.06),
          ),
        ),
      ),
    );
  }

  ///Wraps the widget in the Route
  static Route<T> getRoute<T>(
    Widget widget, {
    RouteSettings? settings,
    String? name,
    Object? arguments,
  }) {
    settings ??= RouteSettings(name: name, arguments: arguments);
    return CupertinoPageRoute(
      settings: settings,
      builder: (context) => PopScope(
        canPop: !Platform.isAndroid ||
            !navigatorKey.currentState!.userGestureInProgress,
        // onWillPop: () async {
        //   if (Platform.isAndroid) {
        //     if (navigatorKey.currentState!.userGestureInProgress) {
        //       return false;
        //     } else {
        //       return true;
        //     }
        //   }
        //
        //   return true;
        // },
        child: widget,
      ),
    );
  }

  ///AppRoutes.push(page: PageName())
  ///
  ///It will push the page to the stack
  ///
  ///it's an alternative of Navigator.push()
  ///
  ///without context and route
  ///
  ///this uses navigatorKey
  static Future<T?>? push<T extends Object?>({
    required Widget page,
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.push<T>(
      getRoute(page, arguments: arguments, name: page.toString()),
    );
  }

  static Future<T?>? pushNamed<T extends Object?>({
    required String name,
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.pushNamed<T>(
      name,
      arguments: arguments,
    );
  }

  ///AppRoutes.pushReplacement(page: PageName())
  ///
  ///It will push the page to the stack
  /// and remove the previous pages
  ///
  static Future<T?>? pushReplacement<T extends Object?, TO extends Object>({
    required Widget page,
    Object? object,
    TO? result,
  }) =>
      navigatorKey.currentState?.pushReplacement<T, TO>(
        getRoute(page, name: page.toString(), arguments: object),
        result: result,
      );

  static Future<T?>?
      pushReplacementNamed<T extends Object?, TO extends Object>({
    required String name,
    Object? arguments,
    TO? result,
  }) =>
          navigatorKey.currentState?.pushReplacementNamed<T, TO>(
            name,
            arguments: arguments,
            result: result,
          );

  ///AppRoutes.pushNamed(page: PageName())
  ///
  ///It will push the page to the stack
  /// and remove all the previous pages
  static Future<T?>? pushAndRemoveUntil<T extends Object?, TO extends Object>({
    required Widget page,
    bool Function(Route<dynamic>)? predicate,
  }) {
    predicate ??= (p0) => false;
    return navigatorKey.currentState?.pushAndRemoveUntil<T>(
      getRoute(page, name: page.toString(), arguments: page),
      predicate,
    );
  }

  static Future<T?>?
      pushNamedAndRemoveUntil<T extends Object?, TO extends Object>({
    required String name,
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) {
    predicate ??= (p0) => false;
    return navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(
      name,
      arguments: arguments,
      predicate,
    );
  }

  ///AppRoutes.pop()
  ///
  ///It will pop the page from the stack
  ///
  static void pop<T extends Object?>([T? results]) =>
      navigatorKey.currentState?.pop<T>(results);

  ///AppRoutes.canPop()
  ///
  ///It will check if the page can be popped
  static bool canPop<T extends Object?>() =>
      navigatorKey.currentState?.canPop() ?? false;

  static Route<dynamic> onNavigate(RouteSettings settings) {
    late final Widget selectedPage;
    switch (settings.name) {
      // case Root.route:
      //   selectedPage = const Root();
      //   break;
      // case OnBoardingScreen.route:
      //   selectedPage = const OnBoardingScreen();
      //   break;
      // case LoginPage.route:
      //   selectedPage = LoginPage();
      //   break;
      // case VerifyOtpPage.route:
      //   selectedPage = const VerifyOtpPage();
      //   break;
      // case CreateProfilePage.route:
      //   selectedPage = const CreateProfilePage();
      //   break;
      // case DashBoard.route:
      //   selectedPage = const DashBoard();
      //   break;
      // case SearchScreen.route:
      //   selectedPage = const SearchScreen();
      //   break;

      // case StudioDetailPage.route:
      //   selectedPage = const StudioDetailPage();
      //   break;

      default:
        selectedPage = const SizedBox();
    }
    return CupertinoPageRoute<dynamic>(
      builder: (context) => PopScope(
          // onWillPop: () async {
          //   if (Platform.isAndroid) {
          //     if (navigatorKey.currentState!.userGestureInProgress) {
          //       return false;
          //     } else {
          //       return true;
          //     }
          //   }
          //
          //   return true;
          // },
          canPop: !Platform.isAndroid ||
              !navigatorKey.currentState!.userGestureInProgress,
          child: selectedPage),
    );
  }
}

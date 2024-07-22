import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:weather_app/core/router/app_routes.dart';
import 'package:weather_app/core/themes/themes.dart';
import 'package:weather_app/src/screens/dashboard/dashboard_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Consumer(builder: (context, ref, child) {
            return MaterialApp(
              title: 'Weather App',
              debugShowCheckedModeBanner: false,
              builder: BotToastInit(),
              navigatorKey: AppRouter.navigatorKey,
              scaffoldMessengerKey: AppRouter.scaffoldMessengerKey,
              onGenerateRoute: AppRouter.onNavigate,
              locale: const Locale('en', ''),
              theme: ref.watch(lightTheme),
              darkTheme: ref.watch(darkTheme),
              themeMode: ref.watch(themeMode),
              home: const DashboardScreen(),
            );
          });
        },
      ),
    );
  }
}

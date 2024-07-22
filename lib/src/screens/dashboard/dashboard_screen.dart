import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/themes/extensions.dart';
import 'package:weather_app/core/themes/paddings.dart';
import 'package:weather_app/core/themes/sizes.dart';
import 'package:weather_app/core/widgets/base_scaffold.dart';
import 'package:weather_app/src/screens/dashboard/provider/dashboard_provider.dart';
import 'package:weather_app/src/widgets/app_loader.dart';

import 'widgets/weather_card.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(dashboardProvider).getCities();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dashboard = ref.watch(dashboardProvider);

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () {
          return ref.read(dashboardProvider).getWeatherData();
        },
        child: dashboard.loading
            ? const AppLoader()
            : dashboard.weatherList.isEmpty
                ? WeatherNoData(
                    retry: () {
                      ref.read(dashboardProvider).getWeatherData();
                    },
                  )
                : GridView.builder(
                    itemCount: dashboard.weatherList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                      top: Paddings.p20.top,
                      left: Paddings.p20.top,
                      right: Paddings.p20.top,
                      bottom: Paddings.p56.top,
                    ),
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: Paddings.p20.left,
                      mainAxisSpacing: Paddings.p20.left,
                    ),
                    itemBuilder: (context, index) {
                      return WeatherCard(
                        data: dashboard.weatherList[index],
                      );
                    },
                  ),
      ),
    );
  }
}

class WeatherNoData extends StatelessWidget {
  const WeatherNoData({super.key, required this.retry});

  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Data Found!',
            style: context.hs,
          ),
          Sizes.h12,
          ElevatedButton(
            onPressed: retry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

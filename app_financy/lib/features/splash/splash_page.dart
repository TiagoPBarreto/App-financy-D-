import 'package:app_financy/common/constants/app_colors.dart';
import 'package:app_financy/common/constants/routes.dart';

import 'package:app_financy/common/widgets/custom_circular_progrees_indicator.dart';

import 'package:app_financy/features/splash/splash_controller.dart';
import 'package:app_financy/features/splash/splash_state.dart';

import 'package:flutter/material.dart';

import '../../common/constants/app_text_styles.dart';
import '../../locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();
  @override
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener(() {
      if (_splashController.state is SplashStateSuccess) {
        Navigator.pushReplacementNamed(context, NamedRoute.home);
      } else {
        Navigator.pushReplacementNamed(context, NamedRoute.initial);
      }
    });
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.greenGradient)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Financy D+',
              style: AppTextStyles.bigText.copyWith(color: AppColors.white),
            ),
            const CustomCircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}

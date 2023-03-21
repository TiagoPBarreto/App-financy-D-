import 'dart:async';

import 'package:app_financy/common/constants/app_colors.dart';
import 'package:app_financy/common/constants/routes.dart';
import 'package:app_financy/common/widgets/custom_circular_progrees_indicator.dart';
import 'package:app_financy/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_text_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Timer init() {
    return Timer(Duration(seconds: 2), navigateToOnborarding);
  }

  void navigateToOnborarding() {
    Navigator.pushReplacementNamed(context, NamedRoute.initial);
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

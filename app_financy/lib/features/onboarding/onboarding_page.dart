import 'dart:developer';

import 'package:app_financy/common/constants/app_colors.dart';
import 'package:app_financy/common/constants/app_text_styles.dart';
import 'package:app_financy/common/constants/routes.dart';
import 'package:app_financy/features/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Column(
        children: [
          const SizedBox(
            height: 48.0,
          ),
          Expanded(child: Image.asset('assets/images/BrazucaBrowsing.png')),
          Text('Spend Smarter',
              textAlign: TextAlign.center,
              style:
                  AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo)),
          Text('Save More',
              textAlign: TextAlign.center,
              style:
                  AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo)),
          Padding(
            padding: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
            child: PrimaryButton(
              text: 'Get Started',
              onPressed: () {
                Navigator.pushNamed(context, NamedRoute.signUp);
              },
            ),
          ),
          MultiTextButton(
            onPressed: () => Navigator.pushNamed(context, NamedRoute.signIn),
            children: [
              Text('Already Have Account? ',
                  style:
                      AppTextStyles.smallText.copyWith(color: AppColors.grey)),
              Text('Sign in',
                  style: AppTextStyles.smallText
                      .copyWith(color: AppColors.greenTwo))
            ],
          ),
          const SizedBox(
            height: 24.0,
          )
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:app_financy/common/constants/app_colors.dart';
import 'package:app_financy/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Align(
        child: Column(
          children: [
            const SizedBox(
              height: 48.0,
            ),
            Expanded(
              flex: 2,
              child: Image.asset('assets/images/BrazucaBrowsing.png'),
            ),
            Text('Spend Smarter',
                style: AppTextStyles.mediumText
                    .copyWith(color: AppColors.greenlightTwo)),
            Text('Save More',
                style: AppTextStyles.mediumText
                    .copyWith(color: AppColors.greenlightTwo)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: PrimaryButton(
                text: 'Get Started',
                onPressed: () {},
              ),
            ),
            MultiTextButton(
              onPressed: () => ('tap'),
              children: [
                Text('Already Have Account? ',
                    style: AppTextStyles.smallText
                        .copyWith(color: AppColors.grey)),
                Text('Log in',
                    style: AppTextStyles.smallText
                        .copyWith(color: AppColors.greenlightTwo))
              ],
            ),
            const SizedBox(
              height: 24.0,
            )
          ],
        ),
      ),
    );
  }
}

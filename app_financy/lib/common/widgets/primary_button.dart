import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const PrimaryButton({
    Key? key,
    this.onPressed, 
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(38.0)),
      child: Ink(
        decoration:  const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(38.0)),
            gradient:  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:AppColors.greenGradient)),
        child: InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            height: 64.0,
            decoration:  BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(38.0)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: onPressed != null? AppColors.greenGradient : AppColors.greyGradient )),
            child: Text(
              text,
              style:
                  AppTextStyles.mediumText18.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
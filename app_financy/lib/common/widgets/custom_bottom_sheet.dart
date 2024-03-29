import 'package:app_financy/common/constants/app_text_styles.dart';
import 'package:app_financy/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Future<void> customModalBottomSheet(BuildContext context,
    {required String content, required String buttonText}) {
  return showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.0), topRight: Radius.circular(28.0))),
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(38.0),
                topRight: Radius.circular(38.0))),
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Ops! Algo deu errado.',
                style: AppTextStyles.mediumText20
                    .copyWith(color: AppColors.greenOne),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: PrimaryButton(
                  text: "Tente novamente",
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

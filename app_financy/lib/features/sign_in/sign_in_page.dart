// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:app_financy/common/constants/routes.dart';
import 'package:app_financy/common/util/validator.dart';
import 'package:app_financy/features/sign_in/sign_in_controller.dart';
import 'package:app_financy/features/sign_in/sign_in_state.dart';
import 'package:app_financy/locator.dart';
import 'package:app_financy/services/mock_auth_service.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_bottom_sheet.dart';
import '../../common/widgets/custom_circular_progrees_indicator.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/password_form_field.dart';
import '../../common/widgets/primary_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = locator.get<SignInController>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignInStateLoading) {
        showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator());
      }
      if (_controller.state is SignInStateSuccess) {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Scaffold(
                      body: Center(
                        child: Text("Nova Tela"),
                      ),
                    )));
      }
      if (_controller.state is SignInStateError) {
        final errorMessage = _controller.state as SignInStateError;
        Navigator.pop(context);
        customModalBottomSheet(context,
            content: errorMessage.message, buttonText: "Tentar Novamente");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text('Welcome Back!',
              textAlign: TextAlign.center,
              style:
                  AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo)),
          Image.asset('assets/images/sign_in_image.png'),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _emailController,
                    labelText: "YOUR EMAIL",
                    hintText: "moses@email.com",
                    validator: Validator.validateEmail,
                  ),
                  PasswordFormField(
                    controller: _passwordController,
                    labelText: "Choose your Password",
                    hintText: "123456#Abcd",
                    validator: Validator.validatePassword,
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
            child: PrimaryButton(
              text: 'Sign In',
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  log("erro ao logar");
                }
              },
            ),
          ),
          MultiTextButton(
            onPressed: () =>
                Navigator.popAndPushNamed(context, NamedRoute.signUp),
            children: [
              Text('Don’t have Account? ',
                  style:
                      AppTextStyles.smallText.copyWith(color: AppColors.grey)),
              Text('Sign up',
                  style: AppTextStyles.smallText
                      .copyWith(color: AppColors.greenTwo))
            ],
          ),
        ],
      ),
    );
  }
}

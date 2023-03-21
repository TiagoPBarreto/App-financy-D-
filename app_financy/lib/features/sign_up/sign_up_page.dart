// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:app_financy/common/util/validator.dart';
import 'package:app_financy/features/sign_up/sign_up_controller.dart';
import 'package:app_financy/features/sign_up/sign_up_state.dart';
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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = SignUpController(MockAuthService());

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator());
      }
      if (_controller.state is SignUpSuccessState) {
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
      if (_controller.state is SignUpErrorState) {
        final errorMessage = _controller.state as SignUpErrorState;
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
          Text('Spend Smarter',
              textAlign: TextAlign.center,
              style:
                  AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo)),
          Text('Save More',
              textAlign: TextAlign.center,
              style:
                  AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo)),
          Image.asset('assets/images/sign_up_image.png'),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _nameController,
                    labelText: "YOUR NAME",
                    hintText: "JHON DOE",
                    validator: Validator.validateName,
                  ),
                  CustomTextFormField(
                    controller: _emailController,
                    labelText: "YOUR EMAIL",
                    hintText: "jhon@email.com",
                    validator: Validator.validateEmail,
                  ),
                  PasswordFormField(
                    controller: _passwordController,
                    labelText: "Choose your Password",
                    hintText: "**********",
                    validator: Validator.validatePassword,
                  ),
                  PasswordFormField(
                    controller: _emailController,
                    labelText: "Confirm your Password",
                    hintText: "**********",
                    validator: (value) => Validator.validateConfirmPassword(
                        value, _passwordController.text),
                    helperText:
                        "Must have at least 8 characters, 1 capital letter and 1 number.",
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
            child: PrimaryButton(
              text: 'Sign Up',
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.signUp(
                    name: _nameController.text,
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
            onPressed: () => ('tap'),
            children: [
              Text('Already Have Account? ',
                  style:
                      AppTextStyles.smallText.copyWith(color: AppColors.grey)),
              Text('Log in',
                  style: AppTextStyles.smallText
                      .copyWith(color: AppColors.greenTwo))
            ],
          ),
        ],
      ),
    );
  }
}

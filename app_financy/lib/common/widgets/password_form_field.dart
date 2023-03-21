import 'dart:developer';

import 'package:app_financy/common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldValidator<String>? validator;

  const PasswordFormField(
      {super.key,
      this.controller,
      this.padding,
      this.hintText,
      this.labelText,
      this.validator,
      this.helperText});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHiden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      helperText: widget.helperText,
      obscureText: isHiden,
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () => {
          log('pressed'),
          setState(() {
            isHiden = !isHiden;
          })
        },
        child: Icon(isHiden ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}

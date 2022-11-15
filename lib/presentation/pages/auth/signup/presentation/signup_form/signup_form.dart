import 'package:flutter/material.dart';

import '../../../../../../common/validation/validation.dart';
import '../../../../../../common/widgets/custom_text_field.dart';


class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget(
      {Key? key,
      required this.validation,
      required this.salonNameController,
      required this.emailController,
      required this.mobileController,
      required this.passController,
        required this.formKey,
      required this.cPassController})
      : super(key: key);

  TextEditingController salonNameController;
  TextEditingController emailController;
  TextEditingController mobileController;
  TextEditingController passController;
  TextEditingController cPassController;
  Validation validation;
  final formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
        child: Column(
      children: [
        CustomFormField(
            controller: salonNameController,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            hint: "User Name",
            validator: validation.shopNameValidation),
        const SizedBox(
          height: 15,
        ),
        CustomFormField(
            controller: emailController,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            hint: "Email Id",
            validator: validation.emailValidation),
        const SizedBox(
          height: 15,
        ),
        CustomFormField(
            controller: mobileController,
            keyboardType: TextInputType.number,
            inputAction: TextInputAction.next,
            hint: "Mobile Number",
            validator: validation.phoneValidation),
        const SizedBox(
          height: 15,
        ),
        CustomFormField(
            controller: passController,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            hint: "Password",
            isObscure: true,
            validator: validation.passValidation),
        const SizedBox(
          height: 15,
        ),
        CustomFormField(
            controller: cPassController,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.done,
            hint: "Confirm Password",
            isObscure: true,
            validator: validation.passValidation),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}

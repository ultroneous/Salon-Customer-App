import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_customer_app/common/utils/app_icons.dart';
import 'package:salon_customer_app/domain/entities/user_entity.dart';

import '../../../../../common/validation/validation.dart';
import '../../../../../common/widgets/btn_icon_widget.dart';
import '../../../../../common/widgets/btn_text_widget.dart';
import '../../../../../common/widgets/progress_dialog.dart';
import '../../bottom_bar/bottom_bar_widget.dart';
import '../bloc/signup_bloc.dart';
import 'signup_form/signup_form.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);
  bool isReqLoading = false;

  TextEditingController salonNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();
  Validation validation = Validation();
  var formKey = GlobalKey<FormState>();

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final dWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
          child: BtnIconWidget(
            icon: SvgPicture.asset(AppIcons.backIcon),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomBarWidget(
          leadingText: "Already have an Account?",
          secondText: "Login",
          onTap: () {
            Navigator.pop(context);
          }),
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignUpLoadingState) {
            ProgressDialog.show(context);
          } else if (state is SignUpSuccessState) {
            ProgressDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content:
                      Text("Signup Successful", textAlign: TextAlign.center)),
            );
            Navigator.of(context).pop(context);
          } else if (state is SignUpErrorState) {
            ProgressDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.exception.toString(),
                    textAlign: TextAlign.center)));
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 44.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text("Sign Up",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: dWidth * 0.6,
                        child: const Text(
                            "Please fill information to create an account and Sign Up",
                            textAlign: TextAlign.center)),
                    const SizedBox(
                      height: 40,
                    ),
                    SignUpFormWidget(
                        formKey: widget.formKey,
                        validation: widget.validation,
                        salonNameController: widget.salonNameController,
                        emailController: widget.emailController,
                        mobileController: widget.mobileController,
                        passController: widget.passController,
                        cPassController: widget.cPassController),
                    const SizedBox(
                      height: 20,
                    ),
                    BtnTextWidget(
                        title: "Sign Up",
                        onTap: () {
                          if (widget.formKey.currentState!.validate()) {
                            _btnSignup(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Please Enter Valid Details!!",
                                        textAlign: TextAlign.center)));
                          }
                        }),
                  ],
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  void _btnSignup(context) {
    SignupBloc signupBloc = BlocProvider.of<SignupBloc>(context);
    if (widget.passController.text == widget.cPassController.text) {
      signupBloc.add(SignupSuccessEvent(
          userEntity: UserEntity(
              userName: widget.salonNameController.text,
              userType: 0,
              email: widget.emailController.text,
              mobile: widget.mobileController.text,
              password: widget.passController.text)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("password and Confirm Password are different",
              textAlign: TextAlign.center)));
    }
  }
}

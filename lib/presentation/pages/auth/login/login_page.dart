import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_customer_app/data/remote/models/user_model.dart';
import '../../../../common/utils/app_colors.dart';
import '../../../../common/validation/validation.dart';
import '../../../widget/app_button.dart';
import '../../../widget/bottom_bar_widget.dart';
import '../../../widget/btn_back.dart';
import '../../../widget/custom_text_field.dart';
import '../../../widget/progress_dialog.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Validation validation = Validation();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final dWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.textWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
          child: BackBtnWidget(
            icon: Icon(Icons.arrow_back, color: AppColors.loginDesc),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomBarWidget(
        leadingText: 'Don’t have an account?',
        secondText: 'Sign Up',
        onTap: () {
          Navigator.of(context).pushNamed("/signup");
        },
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            ProgressDialog.show(context);
          } else if (state is LoginSuccessState) {
            ProgressDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login Successful", textAlign: TextAlign.center),
              ),
            );
            Navigator.of(context).pushReplacementNamed("/dashboard");
          } else if (state is LoginErrorState) {
            ProgressDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.exception.message.toString(),
                    textAlign: TextAlign.center),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 44.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 32,
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: dWidth * 0.8,
                    child: Text(
                      "Enter your email address and password to access your account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.loginDesc,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  CustomFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      hint: "Email id",
                      validator: validation.emailValidation),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      hint: "Password",
                      isObscure: true,
                      validator: validation.passValidation),
                  const SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.forgetPassText,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppBtnWidget(
                    title: "Login",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _loginBtnTapped(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Enter Valid Details!!",
                                textAlign: TextAlign.center),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginBtnTapped(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(
      InitialLogin(
        userModel: UserModel(
            email: emailController.text, password: passwordController.text),
      ),
    );
  }
}

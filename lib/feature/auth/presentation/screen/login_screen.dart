import 'dart:developer';

import 'package:easy_cart/feature/auth/presentation/logic/Auth/auth_bloc.dart';
import 'package:easy_cart/feature/auth/presentation/screen/sign_up_screen.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_button.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:easy_cart/feature/auth/presentation/widget/or_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/row_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/sign_options.dart';
import 'package:easy_cart/feature/error/error_screen.dart';
import 'package:easy_cart/utils/core/custom_theme.dart';
import 'package:easy_cart/utils/extension/nav_extenstion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final textStyle = Theme.of(context).textTheme;
    const height30 = SizedBox(height: 30);
    // ignore: no_leading_underscores_for_local_identifiers
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    // function
    void loginFunc() {
      if (_formKey.currentState!.validate()) {
        context.read<AuthBloc>().add(
              AuthLogin(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              ),
            );
        emailController.clear();
        passwordController.clear();
      }
    }

    void goToSignUp() {
      Navigator.of(context).pushAndRemoveUntilPage(
        const SignUpScreen(),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {}
              if (state is AuthError) {
                log('error: ${state.errorMessage}');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ErrorScreen(
                      error: state.errorMessage,
                      errorCode: '404',
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {}

              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: width / 3.9),
                    CustomText(
                      width: width,
                      textStyle: textStyle,
                      heading: 'Sign In',
                      message: 'Hi! Welcome back, you\'ve been missed',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      width: width,
                      textStyle: textStyle,
                      label: 'Email',
                      hintText: 'Email',
                      // controller: emailController,
                      controller: emailController,
                    ),
                    CustomTextField(
                      obscureText: true,
                      width: width,
                      textStyle: textStyle,
                      label: 'Password',
                      hintText: '*******',
                      suffixIcon:
                          const Icon(CupertinoIcons.eye, color: Colors.black54),
                      // controller: passwordController,
                      controller: passwordController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Forget Password?',
                          style: textStyle.bodySmall?.copyWith(
                            color: mainColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      width: width,
                      btnLabel: 'Sign In',
                      onpress: loginFunc,
                    ),
                    height30,
                    OrText(textStyle: textStyle, text: 'Or sign in with'),
                    height30,
                    const SignOptions(),
                    height30,
                    RowText(
                      textStyle: textStyle,
                      onTap: goToSignUp,
                      text: 'Don\'t have an account?   ',
                      linkText: 'Sign Up',
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:easy_cart/feature/auth/presentation/widget/custom_button.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:easy_cart/feature/auth/presentation/widget/or_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/row_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/sign_options.dart';
import 'package:easy_cart/utils/core/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final textStyle = Theme.of(context).textTheme;
    const height30 = SizedBox(height: 30);
    // ignore: no_leading_underscores_for_local_identifiers
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7),
          child: Form(
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
                  onpress: () {
                    _formKey.currentState?.validate();
                  },
                ),
                height30,
                OrText(textStyle: textStyle, text: 'Or sign in with'),
                height30,
                const SignOptions(),
                height30,
                RowText(
                  textStyle: textStyle,
                  onTap: () {},
                  text: 'Don\'t have an account?   ',
                  linkText: 'Sign Up',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

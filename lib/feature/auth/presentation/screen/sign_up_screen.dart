// import 'package:easy_cart/feature/auth/presentation/logic/Auth/auth_bloc.dart';

import 'package:easy_cart/feature/auth/presentation/screen/create_profile_screen.dart';
import 'package:easy_cart/feature/auth/presentation/screen/login_screen.dart';
import 'package:easy_cart/feature/auth/presentation/widget/checkbox_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_button.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:easy_cart/feature/auth/presentation/widget/or_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/row_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/sign_options.dart';
import 'package:easy_cart/utils/extension/nav_extenstion.dart';
import 'package:easy_cart/utils/extension/snack_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final textStyle = Theme.of(context).textTheme;
    const height30 = SizedBox(height: 20);
    // ignore: no_leading_underscores_for_local_identifiers
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    ValueNotifier<bool> isCheckNotifier = ValueNotifier<bool>(false);
    // functions start
    void checkAndSignUp() {
      if (_formKey.currentState!.validate() && isCheckNotifier.value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateProfile(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            ),
          ),
        );
        emailController.clear();
        passwordController.clear();
      }

      if (!isCheckNotifier.value) {
        context.showSnackBar('please agree');
      }
    }

    void goToLogin() {
      Navigator.of(context).pushAndRemoveUntilPage(
        const LoginScreen(),
      );
    }
    // end

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                CustomText(
                  width: width,
                  textStyle: textStyle,
                  heading: 'Create Account',
                  message:
                      'Fill your information below or register\nwith your social account.',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  width: width,
                  textStyle: textStyle,
                  label: 'Email',
                  hintText: 'Email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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
                ValueListenableBuilder<bool>(
                  valueListenable: isCheckNotifier,
                  builder: (context, currentPage, child) {
                    return CheckBoxAndText(
                      textStyle: textStyle,
                      value: isCheckNotifier.value,
                      onChanged: (bool? value) {
                        isCheckNotifier.value = value!;
                      },
                    );
                  },
                ),
                CustomButton(
                  width: width,
                  btnLabel: 'Sign Up',
                  onpress: checkAndSignUp,
                ),
                height30,
                OrText(textStyle: textStyle, text: 'Or sign up with'),
                height30,
                const SignOptions(),
                height30,
                RowText(
                  textStyle: textStyle,
                  onTap: goToLogin,
                  text: 'Already have an account?   ',
                  linkText: 'Sign in',
                ),
                height30,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

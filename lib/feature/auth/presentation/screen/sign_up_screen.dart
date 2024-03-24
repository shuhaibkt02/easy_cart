// import 'package:easy_cart/feature/auth/presentation/logic/Auth/auth_bloc.dart';
import 'package:easy_cart/feature/auth/presentation/logic/auth_provider.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_button.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:easy_cart/feature/auth/presentation/widget/or_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/row_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/sign_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const SignUpScreenWrapper(),
    );
  }
}

class SignUpScreenWrapper extends StatelessWidget {
  const SignUpScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final textStyle = Theme.of(context).textTheme;
    const height30 = SizedBox(height: 20);
    // ignore: no_leading_underscores_for_local_identifiers
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final prov = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
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
                  label: 'Name',
                  hintText: 'name',
                  controller: prov.nameController,
                ),
                CustomTextField(
                  width: width,
                  textStyle: textStyle,
                  label: 'Email',
                  hintText: 'Email',
                  controller: prov.emailController,
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
                  controller: prov.passwordController,
                ),
                _CheckBoxAndText(textStyle: textStyle, prov: prov),
                CustomButton(
                  width: width,
                  btnLabel: 'Sign Up',
                  onpress: () => prov.signUpFunc(
                    context: context,
                    formKey: _formKey,
                  ),
                ),
                height30,
                OrText(textStyle: textStyle, text: 'Or sign up with'),
                height30,
                const SignOptions(),
                height30,
                RowText(
                  textStyle: textStyle,
                  onTap: () => prov.goToLogin(context: context),
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

class _CheckBoxAndText extends StatelessWidget {
  const _CheckBoxAndText({
    required this.textStyle,
    required this.prov,
  });

  final TextTheme textStyle;
  final AuthProvider prov;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: prov.isChecked,
            onChanged: (value) {
              prov.onChanged(value);
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: RowText(
              textStyle: textStyle,
              onTap: () {},
              text: 'Agree with ',
              linkText: 'Terms & Condition',
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:easy_cart/feature/auth/presentation/logic/Auth/auth_bloc.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_button.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:easy_cart/feature/auth/presentation/widget/or_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/row_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/sign_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final textStyle = Theme.of(context).textTheme;
    const height30 = SizedBox(height: 20);
    // ignore: no_leading_underscores_for_local_identifiers
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    TextEditingController nameController = TextEditingController();
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
                  controller: nameController,
                ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
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
                ),
                CustomButton(
                  width: width,
                  btnLabel: 'Sign Up',
                  onpress: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                            AuthSignUp(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                    }
                  },
                ),
                height30,
                OrText(textStyle: textStyle, text: 'Or sign up with'),
                height30,
                const SignOptions(),
                height30,
                RowText(
                  textStyle: textStyle,
                  onTap: () {},
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

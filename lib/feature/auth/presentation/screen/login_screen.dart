import 'package:easy_cart/feature/auth/presentation/logic/auth_provider.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_button.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:easy_cart/feature/auth/presentation/widget/or_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/row_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/sign_options.dart';
import 'package:easy_cart/utils/core/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const LoginScreenWrapper(),
    );
  }
}

class LoginScreenWrapper extends StatelessWidget {
  const LoginScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final textStyle = Theme.of(context).textTheme;
    const height30 = SizedBox(height: 30);
    final prov = Provider.of<AuthProvider>(context);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  // controller: emailController,
                  controller: prov.emailController,
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
                  controller: prov.passwordController,
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
                    prov.loginFunc(formKey: _formKey, context: context);
                  },
                ),
                height30,
                OrText(textStyle: textStyle, text: 'Or sign in with'),
                height30,
                const SignOptions(),
                height30,
                RowText(
                  textStyle: textStyle,
                  onTap: () => prov.goToSignUp(context: context),
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

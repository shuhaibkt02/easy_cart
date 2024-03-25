
import 'package:easy_cart/feature/auth/presentation/logic/Auth/auth_bloc.dart';
import 'package:easy_cart/feature/auth/presentation/screen/login_screen.dart';
import 'package:easy_cart/feature/auth/presentation/screen/sign_up_screen.dart';
import 'package:easy_cart/utils/extension/nav_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isChecked = false;

  get isChecked => _isChecked;

  void onChanged(bool? value) {
    _isChecked = value!;
    notifyListeners();
  }

  void signUpFunc(
      {required BuildContext context, required GlobalKey<FormState> formKey}) {
    if (formKey.currentState!.validate() && isChecked) {
      context.read<AuthBloc>().add(
            AuthSignUp(
              name: nameController.text.trim(),
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            ),
          );
      nameController.clear();
      emailController.clear();
      passwordController.clear();
    }

    if (!isChecked) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('please check agree')));
    }
  }

  loginFunc(
      {required BuildContext context, required GlobalKey<FormState> formKey}) {
    if (formKey.currentState!.validate()) {
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

  void goToSignUp({required BuildContext context}) {
    Navigator.of(context).pushAndRemoveUntilPage(
      const SignUpScreen(),
    );
  }

  goToLogin({required BuildContext context}) {
    Navigator.of(context).pushAndRemoveUntilPage(
      const LoginScreen(),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

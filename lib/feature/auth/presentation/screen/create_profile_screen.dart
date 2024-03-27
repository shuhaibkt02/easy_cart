import 'dart:io';

import 'package:easy_cart/feature/auth/presentation/logic/Auth/auth_bloc.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_button.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:easy_cart/feature/auth/presentation/widget/dropdown_custom.dart';
import 'package:easy_cart/feature/auth/presentation/widget/edit_picture.dart';
import 'package:easy_cart/feature/auth/presentation/widget/phone_number_field.dart';
import 'package:easy_cart/feature/error/error_screen.dart';
import 'package:easy_cart/utils/extension/nav_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfile extends StatelessWidget {
  final String email;
  final String password;
  const CreateProfile({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final textStyle = Theme.of(context).textTheme;
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    ValueNotifier<String> genderNotifier = ValueNotifier<String>('');
    ValueNotifier<String> codeNotifier = ValueNotifier<String>('');
    ValueNotifier<String> imageNotifier = ValueNotifier<String>('');

    onChange({required ValueNotifier<String> notifier, required String value}) {
      notifier.value = value;
    }

    // function
    void completeProcess() {
      if (_formKey.currentState!.validate()) {
        String phone = '${codeNotifier.value} ${phoneController.text.trim()}';
        context.read<AuthBloc>().add(
              AuthSignUp(
                name: nameController.text.trim(),
                email: email,
                password: password,
                phone: phone,
                gender: genderNotifier.value,
                imagePath: imageNotifier.value,
              ),
            );
      }
    }

    Future<void> pickingAvatar() async {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        final imageFile = File(pickedImage.path);
        imageNotifier.value = imageFile.path;
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.of(context).pushAndRemoveUntilPage(
                  Container(),
                );
              }
              if (state is AuthError) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ErrorScreen(error: state.errorMessage, errorCode: 'errorCode'),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {}
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomText(
                      width: width,
                      textStyle: textStyle,
                      heading: 'Complete Your Profile',
                      message:
                          'Don\'t worry, only you can see your personal\ndata. No one else will be able to see it.',
                    ),
                    EditProfile(
                      width: width,
                      imageNotifier: imageNotifier,
                      onPress: pickingAvatar,
                    ),
                    CustomTextField(
                      width: width,
                      textStyle: textStyle,
                      label: 'Name',
                      hintText: 'Enter your name',
                      controller: nameController,
                    ),
                    CustomTextField(
                      width: width,
                      textStyle: textStyle,
                      label: 'Phone Number',
                      hintText: 'Enter phone number',
                      controller: nameController,
                      child: PhoneField(
                        textStyle: textStyle,
                        width: width,
                        controller: phoneController,
                        onSelect: (code) =>
                            onChange(notifier: codeNotifier, value: code!),
                        dropList: const ['+1', '+91'],
                        valueListenable: codeNotifier,
                      ),
                    ),
                    CustomTextField(
                      width: width,
                      textStyle: textStyle,
                      label: 'Gender',
                      hintText: '',
                      controller: nameController,
                      child: CustomDropDown(
                        textStyle: textStyle,
                        width: width,
                        dropList: const ['Male', 'Female'],
                        onSelect: (value) =>
                            onChange(notifier: genderNotifier, value: value!),
                        valueListenable: genderNotifier,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      width: width,
                      btnLabel: 'Complete Profile',
                      onpress: completeProcess,
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

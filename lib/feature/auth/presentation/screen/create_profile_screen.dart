import 'package:easy_cart/feature/auth/presentation/widget/custom_button.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text.dart';
import 'package:easy_cart/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:easy_cart/feature/auth/presentation/widget/dropdown_custom.dart';
import 'package:easy_cart/feature/auth/presentation/widget/phone_number_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final textStyle = Theme.of(context).textTheme;
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    // function
    void completeProcess() {
      if (_formKey.currentState!.validate()) {}
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7),
          child: Form(
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
                _EditProfile(
                  width: width,
                  ontap: () {},
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
                    onSelect: (value) {},
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
          ),
        ),
      ),
    );
  }
}

class _EditProfile extends StatelessWidget {
  const _EditProfile({
    required this.width,
    required this.ontap,
  });

  final double width;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width / 3,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 66,
            child: const Icon(CupertinoIcons.person_fill, size: 30),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: GestureDetector(
              onTap: ontap,
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green,
                child: Icon(
                  CupertinoIcons.pencil,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

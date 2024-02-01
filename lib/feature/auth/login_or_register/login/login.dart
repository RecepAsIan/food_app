import 'package:eat_meat/feature/auth/login_or_register/login/login_mixin.dart';
import 'package:eat_meat/product/constants/image_constants.dart';
import 'package:eat_meat/product/constants/string_constants.dart';
import 'package:eat_meat/product/enums/image_size.dart';
import 'package:eat_meat/product/utility/padding.dart';
import 'package:eat_meat/product/widgets/my_image.dart';
import 'package:eat_meat/product/widgets/my_button.dart';
import 'package:eat_meat/product/widgets/text_field/my_text_field.dart';
import 'package:eat_meat/product/widgets/text_field/my_text_field_password.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: AppPadding.pagePaddingLow,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                MyImage(
                  imageText: ImageConstants.loginRegister,
                  height: ImageSize.loginRegisterImage.value.toDouble(),
                ),
                MyTextField(
                  controller: email,
                  hintText: StringConstants.email,
                ),
                Padding(
                  padding: AppPadding.paddingTopLow,
                  child: MyTextFieldPassword(
                    controller: password,
                    hintText: StringConstants.password,
                  ),
                ),
                Padding(
                  padding: AppPadding.paddingTopLow,
                  child: MyButton(
                    onPressed: () {
                      signIn(
                        email: email.text,
                        password: password.text,
                      );
                    },
                    text: StringConstants.textLogin,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringConstants.loginText,
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: widget.onPressed,
                        child: const Text(
                          StringConstants.register,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

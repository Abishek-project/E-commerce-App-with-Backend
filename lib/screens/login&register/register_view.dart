import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/screens/components/custom_button.dart';
import 'package:ecommerce/screens/login&register/login_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_path.dart';
import '../../constants/app_strings.dart';
import '../components/custom_textfield.dart';
import '../components/social_button.dart';

class RegistrationView extends GetView<LoginAndRegisterationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // call this method here to hide soft keyboard
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    welcomeText(),
                    signUpDescription(),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: controller.formKey1,
                      child: Column(
                        children: [
                          emailTextField(),
                          const SizedBox(height: 15),
                          userTextField(),
                          const SizedBox(
                            height: 15,
                          ),
                          passwordTextField(),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    dividerWidget(),
                    const SizedBox(
                      height: 35,
                    ),
                    socialButton(),
                    signUPButton(context),
                    loginWidget(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Padding loginWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: AppStrings.alreadyHaveAccount,
                    style: AppTypography.appSubTitle1
                        .copyWith(color: Appcolors.lightGray09)),
                const WidgetSpan(
                  child: SizedBox(
                    width: 5,
                  ),
                ),
                TextSpan(
                  text: AppStrings.login,
                  style: AppTypography.appSubTitlebold
                      .copyWith(color: Appcolors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Single tapped.
                      Get.delete();
                      Get.offNamed(AppPaths.login);
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column passwordTextField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppStrings.password,
                style: AppTypography.bodyMedium2,
              ),
            ],
          ),
        ),
        TextFieldWidget(
          validator: (value) {
            if (value == null || value == "") {
              return AppStrings.enteryourpassword;
            }
            if (value.length < 6) {
              return AppStrings.passwordValidation;
            }
            return null;
          },
          controller: controller.registrationPassword,
          obscureText: false,
          hintText: AppStrings.password,
          prefixIcon: Icon(
            Icons.lock,
            color: Appcolors.lightGray09,
          ),
        ),
      ],
    );
  }

  Column emailTextField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppStrings.email,
                style: AppTypography.bodyMedium2,
              ),
            ],
          ),
        ),
        TextFieldWidget(
          validator: (value) {
            if (value == null || value == "") {
              return AppStrings.enteryouremail;
            }
            return null;
          },
          controller: controller.registrationEmail,
          obscureText: false,
          hintText: AppStrings.emailAddress,
          prefixIcon: Icon(
            Icons.email,
            color: Appcolors.lightGray09,
          ),
        ),
      ],
    );
  }

  Column userTextField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppStrings.username,
                style: AppTypography.bodyMedium2,
              ),
            ],
          ),
        ),
        TextFieldWidget(
          validator: (value) {
            if (value == null || value == "") {
              return AppStrings.enteryourName;
            }
            return null;
          },
          controller: controller.userName,
          obscureText: false,
          hintText: AppStrings.username,
          prefixIcon: Icon(
            Icons.person,
            color: Appcolors.lightGray09,
          ),
        ),
      ],
    );
  }

  Text signUpDescription() {
    return Text(AppStrings.signUpDescription,
        style:
            AppTypography.appSubTitle4.copyWith(color: Appcolors.lightGray09));
  }

  Text welcomeText() {
    return Text(
      AppStrings.letGeStarted,
      style: AppTypography.appTitle,
    );
  }

  Row forgotwidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(AppStrings.forgotyourpassword,
            style: AppTypography.appSubTitle1
                .copyWith(color: Appcolors.darkGray01)),
      ],
    );
  }

  Padding dividerWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1.5,
              color: Appcolors.grey,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            AppStrings.or,
            style: AppTypography.appSubTitle2
                .copyWith(color: Appcolors.lightGray09),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Divider(
              thickness: 1.5,
              color: Appcolors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Padding socialButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SocialButton(
            iconName: AppAssets.faceBook,
          ),
          SocialButton(
            iconName: AppAssets.google,
          ),
          SocialButton(
            iconName: AppAssets.apple,
          ),
        ],
      ),
    );
  }

  Padding signUPButton(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, right: 10, left: 10),
      child: Obx(() => Button(
            onTap: (() {
              if (controller.formKey1.currentState!.validate()) {
                controller.isSignUp.value = true;

                controller.userSignUp(
                    controller.userName.text,
                    controller.registrationEmail.text,
                    controller.registrationPassword.text);
              }
            }),
            child: controller.isSignUp.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 1,
                    ),
                  )
                : const Center(
                    child: Text(
                      AppStrings.signUp,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
          )),
    );
  }
}

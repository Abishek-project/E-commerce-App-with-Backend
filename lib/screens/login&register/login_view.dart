import 'package:ecommerce/constants/app_assets.dart';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/constants/app_strings.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/screens/components/custom_button.dart';
import 'package:ecommerce/screens/login&register/login_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_textfield.dart';
import '../components/social_button.dart';

class LoginView extends GetView<LoginAndRegisterationController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // call this method here to hide soft keyboard
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 19, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      welcomeText(),
                      loginDescription(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Form(
                        key: controller.formKey2,
                        child: Column(
                          children: [
                            emailTextField(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            passwordTextField(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                      forgotwidget(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      dividerWidget(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      socialButton(),
                      loginButton(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      registerWidget(),
                    ],
                  ),
                ),
              ),
              bottomButton(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding registerWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: AppStrings.notMember,
                    style: AppTypography.appSubTitle1
                        .copyWith(color: Appcolors.lightGray09)),
                const WidgetSpan(
                  child: SizedBox(
                    width: 5,
                  ),
                ),
                TextSpan(
                  text: AppStrings.registerNow,
                  style: AppTypography.appSubTitlebold
                      .copyWith(color: Appcolors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Single tapped.
                      Get.delete();
                      Get.offNamed(AppPaths.registration);
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding bottomButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  text: AppStrings.bottomDescription,
                  style: AppTypography.appSubTitle1
                      .copyWith(color: Appcolors.lightGray09)),
              const WidgetSpan(
                  child: SizedBox(
                width: 5,
              )),
              TextSpan(
                  text: AppStrings.termsAndCondition,
                  style: AppTypography.appSubTitlebold
                      .copyWith(color: Appcolors.appBlackDark))
            ],
          ),
        ),
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
          controller: controller.loginPassword,
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
                AppStrings.username,
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
            if (value.length < 6) {
              return AppStrings.passwordValidation;
            }
            return null;
          },
          controller: controller.loginEmail,
          obscureText: false,
          hintText: AppStrings.emailAddress,
          prefixIcon: Icon(
            Icons.person,
            color: Appcolors.lightGray09,
          ),
        ),
      ],
    );
  }

  Text loginDescription() {
    return Text(AppStrings.loginDescription,
        style:
            AppTypography.appSubTitle4.copyWith(color: Appcolors.lightGray09));
  }

  Text welcomeText() {
    return Text(
      AppStrings.welcome,
      style: AppTypography.appTitle,
    );
  }

  forgotwidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(AppStrings.forgotyourpassword,
              style: AppTypography.appSubTitle1
                  .copyWith(color: Appcolors.darkGray01)),
        ],
      ),
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

  Padding loginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 35, right: 10, left: 10),
      child: Obx(() => Button(
            onTap: (() {
              if (controller.formKey2.currentState!.validate()) {
                controller.isLogin.value = true;

                controller.userSignIn(
                    controller.loginEmail.text, controller.loginPassword.text);
              }
            }),
            child: controller.isLogin.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 1,
                    ),
                  )
                : const Center(
                    child: Text(
                      AppStrings.login,
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

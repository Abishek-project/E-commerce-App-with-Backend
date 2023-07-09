import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_textStyle.dart';
import 'package:ecommerce/screens/components/custom_button.dart';
import 'package:ecommerce/screens/login&register/login_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_path.dart';
import '../components/custom_textfield.dart';
import '../components/social_button.dart';

class RegistrationView extends GetView<LoginAndRegisterationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  dividerWidget(),
                  const SizedBox(
                    height: 35,
                  ),
                  socialButton(),
                  signUPButton(),
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
                    text: "Already have a account ?",
                    style: AppTypography.appSubTitle1
                        .copyWith(color: Appcolors.lightGray09)),
                const WidgetSpan(
                  child: SizedBox(
                    width: 5,
                  ),
                ),
                TextSpan(
                  text: "Login",
                  style: AppTypography.appSubTitlebold
                      .copyWith(color: Appcolors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Single tapped.
                      Get.toNamed(AppPaths.login);
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
                  text:
                      "By connecting your account confirm that you agree with our",
                  style: AppTypography.appSubTitle1
                      .copyWith(color: Appcolors.lightGray09)),
              const WidgetSpan(
                  child: SizedBox(
                width: 5,
              )),
              TextSpan(
                  text: "Terms and condition.",
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
                "Password",
                style: AppTypography.bodyMedium2,
              ),
            ],
          ),
        ),
        TextFieldWidget(
          controller: controller.registrationPassword,
          obscureText: false,
          hintText: "Password",
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
                "Email",
                style: AppTypography.bodyMedium2,
              ),
            ],
          ),
        ),
        TextFieldWidget(
          controller: controller.registrationEmail,
          obscureText: false,
          hintText: "Email address",
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
                "Username",
                style: AppTypography.bodyMedium2,
              ),
            ],
          ),
        ),
        TextFieldWidget(
          controller: controller.userName,
          obscureText: false,
          hintText: "User name",
          prefixIcon: Icon(
            Icons.person,
            color: Appcolors.lightGray09,
          ),
        ),
      ],
    );
  }

  Text signUpDescription() {
    return Text("Sign up and we will continue",
        style:
            AppTypography.appSubTitle4.copyWith(color: Appcolors.lightGray09));
  }

  Text welcomeText() {
    return Text(
      "Let's Get Started!",
      style: AppTypography.appTitle,
    );
  }

  Row forgotwidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Forgot your Password?",
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
            "Or",
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
            iconName: "assets/facebook.svg",
          ),
          SocialButton(
            iconName: "assets/google.svg",
          ),
          SocialButton(
            iconName: "assets/apple.svg",
          ),
        ],
      ),
    );
  }

  Padding signUPButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 35, right: 10, left: 10),
      child: Button(
        buttonText: "Sign Up",
        onTap: (() {}),
      ),
    );
  }
}

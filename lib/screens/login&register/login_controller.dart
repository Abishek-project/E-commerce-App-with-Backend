import 'package:ecommerce/constants/app_path.dart';
import 'package:ecommerce/screens/components/error_handling.dart';
import 'package:ecommerce/screens/login&register/login_variable.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginAndRegisterationController extends GetxController
    with LoginAndRegisterationVariable {
  void userSignUp(
    String name,
    String email,
    String password,
  ) async {
    try {
      http.Response response = await authService.signUp(name, email, password);
      if (response.statusCode != 200) {
        isSignUp.value = false;
        ErrorHandling.errorHandling(response);
      } else if (response.statusCode == 200) {
        isSignUp.value = false;
        Get.offNamed(AppPaths.login);
      }
    } catch (e) {
      isSignUp.value = false;
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void userSignIn(
    String email,
    String password,
  ) async {
    try {
      http.Response response = await authService.signIn(email, password);
      if (response.statusCode != 200) {
        isLogin.value = false;
        ErrorHandling.errorHandling(response);
      } else if (response.statusCode == 200) {
        isLogin.value = false;
        Get.showSnackbar(
          GetSnackBar(
            message: '${response.body}',
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      isLogin.value = false;
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}

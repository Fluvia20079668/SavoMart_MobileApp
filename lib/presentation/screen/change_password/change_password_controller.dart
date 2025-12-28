import 'package:savomart/domain/usecases/change_password_usecase.dart';
import 'package:savomart/utils/snackbar_uils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends ChangeNotifier {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  ChangePasswordUsecase changePasswordUsecase = Get.find();

  bool buttonLoading = false;

  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  final formKey = GlobalKey<FormState>(debugLabel: 'change_password_form_key');
  bool validate() {
    bool valid = false;
    if (formKey.currentState!.validate()) {
      valid = true;
    }
    return valid;
  }

  bool passwordVisible = false;
  passwordVissibility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  bool newPasswordVisible = false;
  newPasswordVissibility() {
    newPasswordVisible = !newPasswordVisible;
    notifyListeners();
  }

  bool cnfPasswordVisible = false;
  cnfPasswordVissibility() {
    cnfPasswordVisible = !cnfPasswordVisible;
    notifyListeners();
  }

  changePassword() async {
    if (validate()) {
      makeButtonLoading();
      ChangePasswordParams changePasswordParams = ChangePasswordParams(
          oldPassword: oldPasswordController.text,
          newPassword: newPasswordController.text,
          cnfPassword: confirmPasswordController.text);
      final response = await changePasswordUsecase(changePasswordParams);
      response.fold((l) {
        l.handleError();
      }, (r) {
        if (r["status"]) {
          showMessage(r["message"]);
          Get.back();
        } else {
          if (r["message"] is String) {
            showMessage(r["message"]);
          } else {
            r["message"].forEach((key, value) {
              showMessage(value[0]);
            });
          }
        }
      });
      makeButtonNotLoading();
    }
  }
}

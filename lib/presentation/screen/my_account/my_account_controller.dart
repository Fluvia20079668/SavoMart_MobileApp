import 'dart:io';

import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/usecases/update_profile_usecase.dart';
import 'package:savomart/domain/usecases/upload_profile_picture_usecase.dart';
import 'package:savomart/domain/usecases/user_info_usecase.dart';
import 'package:savomart/presentation/screen/profile_screen/profile_screen_controller.dart';
import 'package:savomart/utils/debug_utils.dart';
import 'package:savomart/utils/image_picker_service.dart';
import 'package:savomart/utils/snackbar_uils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/auth_wrapper/auth_controller.dart';

class MyaccountController extends ChangeNotifier {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  String? name;
  AuthController authController = Get.find();

  UpdateProfileUsecase updateProfileUsecase = Get.find();
  UploadProfilePictureUseCase uploadProfilePictureUseCase = Get.find();
  UserInfoUseCase userInfoUseCase = Get.find();
  ProfileScreenController profileScreenController = Get.find();

  File? profileImages;
  String? profileNetworkImages;

  bool buttonLoading = false;

  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  final formKey = GlobalKey<FormState>(debugLabel: 'edit_profile_form_key');
  bool validate() {
    bool valid = false;
    if (formKey.currentState!.validate()) {
      valid = true;
    }
    return valid;
  }

  AppError? appError;
  bool isLoading = true;
  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  retry() async {
    makeLoading();
    getData();
  }

  getData() async {
    appError = null;
    authController.getUser();
    nameController.text = authController.user!.firstname;
    emailController.text = authController.user!.email;
    phoneController.text = authController.user!.phone;
    name = authController.user!.firstname;
    getUserInfo();
    notifyListeners();
  }

  getUserInfo() async {
    final response = await userInfoUseCase(NoParams());
    response.fold((l) {
      l.handleError();
    }, (r) {
      if (r["status"]) {
        if (r["user"]["profile_picture_url"] != null &&
            r["user"]["profile_picture_url"] != "") {
          profileNetworkImages = r["user"]["profile_picture_url"];
        } else {
          profileNetworkImages = null;
        }
      }
    });
    notifyListeners();
  }

  addProfileImage() async {
    final file = await ImagePickerService.imagePickerType();
    if (file != null) {
      profileImages = file;
      consoleLog(profileImages);
      UploadProfilePictureParams uploadProfilePictureParams =
          UploadProfilePictureParams(
              images: {"profile_picture": profileImages!});
      uploadProfilPicture(uploadProfilePictureParams);
      notifyListeners();
    }
  }

  updateProfile() async {
    if (validate()) {
      makeButtonLoading();
      UpdateProfileParams updateProfileParams = UpdateProfileParams(
          firstName: nameController.text,
          email: emailController.text,
          phone: phoneController.text);
      final response = await updateProfileUsecase(updateProfileParams);
      response.fold((l) {
        l.handleError();
      }, (r) {
        if (r["status"]) {
          profileScreenController.getData();
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

  uploadProfilPicture(
      UploadProfilePictureParams uploadProfilePictureParams) async {
    final response =
        await uploadProfilePictureUseCase(uploadProfilePictureParams);
    response.fold((l) {
      l.handleError();
    }, (r) {
      if (r["status"]) {
        if (r["data"]["customer"]["profile_picture_url"] != null &&
            r["data"]["customer"]["profile_picture_url"] != "") {
          profileNetworkImages = r["data"]["customer"]["profile_picture_url"];
        } else {
          profileNetworkImages = null;
        }
        profileScreenController.getData();
      }
    });
    notifyListeners();
  }
}

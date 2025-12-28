import 'package:savomart/domain/params/addaddressparams.dart';
import 'package:savomart/domain/params/address_params.dart';
import 'package:savomart/domain/usecases/add_address_usecase.dart';
import 'package:savomart/presentation/screen/checkout_screen/checkout_screen_controller.dart';
import 'package:savomart/presentation/screen/my_address_screen/my_address_screen_controller.dart';
import 'package:savomart/utils/debug_utils.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import '../../../domain/usecases/update_address_usecase.dart';
import '../../../utils/snackbar_uils.dart';

class AddAddressController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>(debugLabel: 'add_address_form_key');

  final addressController = TextEditingController();
  final streetController = TextEditingController();
  final phoneController = TextEditingController();
  AddAddressUsecase addAddressUsecase = Get.find();
  CheckoutScreenController checkoutScreenController = Get.find();
  MyAddressController myAddressController = Get.find();
  UpdateAddressUsecase updateAddressUsecase = Get.find();

  ChangeAddressParam? changeAddressArgs = Get.arguments;
  // PickResult? selectedAddress;
  // LatLng? geoLocation;

  bool buttonLoading = false;
  makeButtonLoading() {
    buttonLoading = true;
    notifyListeners();
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    notifyListeners();
  }

  setData() {
    // setCurrentLocation();
    if (changeAddressArgs != null && changeAddressArgs?.addressParams != null) {
      consoleLog("addressId ${changeAddressArgs!.addressParams!.addressId}");
      addressController.text = changeAddressArgs!.addressParams!.address!;
      streetController.text = changeAddressArgs!.addressParams!.street!;
      phoneController.text = changeAddressArgs!.addressParams!.phone!;

      notifyListeners();
    }
  }

  bool validate() {
    bool valid = false;
    if (formKey.currentState!.validate()) {
      valid = true;
    }
    return valid;
  }

  setCurrentLocation() async {
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      // final lat = position.latitude;
      // final lng = position.longitude;
      // refreshMapLocation(LatLng(lat, lng));
    }).catchError((e) {
      consoleLog(e);
    });
  }

  // refreshMapLocation(LatLng newLocation) async {
  //   geoLocation = null;
  //   notifyListeners();
  //   await Future.delayed(const Duration(seconds: 1));
  //   geoLocation = newLocation;
  //   notifyListeners();
  // }

  // changeLocation(BuildContext context) async {
  //   // final pickedLocation = await pickLocationFromMap(context);
  //   if (pickedLocation != null) {
  //     // selectedAddress = pickedLocation;
  //     addressController.text = pickedLocation.formattedAddress!;
  //     streetController.text = pickedLocation.addressComponents![1].longName;
  //     final lat = pickedLocation.geometry!.location.lat;
  //     final lng = pickedLocation.geometry!.location.lng;
  //     // refreshMapLocation(LatLng(lat, lng));
  //   }
  // }

  addUserAddress() async {
    if (validate()) {
      if (changeAddressArgs != null &&
          changeAddressArgs?.addressParams != null) {
        updateAddress();
      } else {
        addAddress();
      }
    }
  }

  addAddress() async {
    makeButtonLoading();
    AddAddressParam addAddressParam = AddAddressParam(
        address: addressController.text,
        street: streetController.text,
        phone: phoneController.text);
    final response = await addAddressUsecase(addAddressParam);
    response.fold((l) => l.handleError(), (r) {
      if (r["status"]) {
        showMessage(r['message']);
        makeButtonNotLoading();
        Get.back();
        if (changeAddressArgs != null &&
            changeAddressArgs?.from != null &&
            changeAddressArgs?.from == "addnew") {
          checkoutScreenController.getAddress();
        } else {
          myAddressController.getData();
        }
      } else {
        makeButtonNotLoading();
      }
    });
  }

  updateAddress() async {
    makeButtonLoading();
    AddAddressParam addAddressParam = AddAddressParam(
        addressId: changeAddressArgs?.addressParams?.addressId,
        address: addressController.text,
        street: streetController.text,
        phone: phoneController.text);
    final response = await updateAddressUsecase(addAddressParam);
    response.fold((l) => l.handleError(), (r) {
      if (r["status"]) {
        showMessage(r['message']);
        Get.back();
        myAddressController.getData();
      }
    });
    makeButtonNotLoading();
  }
}

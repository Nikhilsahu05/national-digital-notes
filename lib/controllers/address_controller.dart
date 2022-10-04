import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  RxString name = ''.obs;
  RxString fullAddress = ''.obs;
  RxString houseNumber = ''.obs;
  RxString city = ''.obs;
  RxString state = ''.obs;
  RxInt indexOfTile = 0.obs;

  RxList addedAddressList = RxList();

  addAddress() {
    addedAddressList.add({
      'name': name.value,
      'fullAddress': fullAddress.value,
      'houseNumber': houseNumber.value,
      'city': city.value,
      'state': state.value,
    });

    if (kDebugMode) {
      print(addedAddressList.length);
      print(addedAddressList.value);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_digital_notes/controllers/address_controller.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController houseNumber = TextEditingController();
  TextEditingController fullAddress = TextEditingController();
  TextEditingController cityAddress = TextEditingController();
  TextEditingController stateAddress = TextEditingController();

  AddressController addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Address"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: houseNumber,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'House No.',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: fullAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Full Address',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: cityAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'City',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: stateAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'State',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  addressController.fullAddress.value = fullAddress.text;
                  addressController.name.value = nameController.text;
                  addressController.houseNumber.value = houseNumber.text;
                  addressController.city.value = cityAddress.text;
                  addressController.state.value = stateAddress.text;

                  addressController.addAddress();
                  Get.back();
                },
                child: const Text("Add address"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

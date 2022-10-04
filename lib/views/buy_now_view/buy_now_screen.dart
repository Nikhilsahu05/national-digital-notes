import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_digital_notes/controllers/address_controller.dart';
import 'package:national_digital_notes/views/specific_book_details_screen/add_address_screen.dart';

import '../order_placed_screen/order_placed_view.dart';

class BuyNowScreen extends StatefulWidget {
  String bookName;
  String imageURL;
  String category;

  BuyNowScreen({super.key,
    required this.category,
    required this.bookName,
    required this.imageURL});

  @override
  State<BuyNowScreen> createState() => _BuyNowScreenState();
}

class _BuyNowScreenState extends State<BuyNowScreen> {
  int qn = 0;
  AddressController addressController = Get.put(AddressController());
  String? payment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: Obx(
            () =>
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.asset(widget.imageURL),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.bookName,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Flexible(
                                  child: Text(
                                    widget.category,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade700),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 25,
                                    child: ListView(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      children: const [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "₹ 999",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          letterSpacing: 1.2,
                                          color: Colors.green),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "₹ 1549",
                                      style: TextStyle(
                                          decoration: TextDecoration
                                              .lineThrough,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          letterSpacing: 1.2,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    height: 35,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.4,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              shape: BoxShape.circle),
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (qn != 0) {
                                                    qn--;
                                                  }
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                size: 20,
                                              )),
                                        ),
                                        Text("$qn"),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              shape: BoxShape.circle),
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  qn++;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                size: 20,
                                              )),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.delete))
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1.2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: InkWell(
                        onTap: () {
                          if (kDebugMode) {
                            print("About this eBook");
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Delivery Location",
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                                ),
                                if (addressController.addedAddressList
                                    .isNotEmpty)
                                  IconButton(
                                      onPressed: () {
                                        Get.to(AddAddressScreen());
                                      },
                                      icon: Icon(Icons.add))
                              ],
                            ),
                            if (addressController.addedAddressList.isEmpty)
                              ListTile(
                                onTap: () {
                                  Get.to(const AddAddressScreen());
                                },
                                leading: const Icon(Icons.gps_fixed),
                                title: const Text("No Address added"),
                                subtitle: const Text("Tap on the icon to add"),
                                trailing: const Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                            if (addressController.addedAddressList.isNotEmpty)
                              Obx(
                                    () =>
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                        addressController.addedAddressList
                                            .length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            selected:
                                            addressController.indexOfTile
                                                .value ==
                                                index
                                                ? true
                                                : false,
                                            onTap: () {
                                              addressController.indexOfTile
                                                  .value =
                                                  index;
                                            },
                                            leading: const Icon(
                                                Icons.gps_fixed),
                                            title: Text(
                                                "${addressController
                                                    .addedAddressList[index]['name']}, ${addressController
                                                    .addedAddressList[index]['fullAddress']}"),
                                            subtitle: Text(
                                                "${addressController
                                                    .addedAddressList[index]['houseNumber']}, ${addressController
                                                    .addedAddressList[index]['city']}, ${addressController
                                                    .addedAddressList[index]['state']}"),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              size: 16,
                                            ),
                                          );
                                        }),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: InkWell(
                        onTap: () {
                          if (kDebugMode) {
                            print("About this eBook");
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: RadioListTile(
                                    title: Text("Online"),
                                    value: "Online",
                                    groupValue: payment,
                                    onChanged: (value) {
                                      setState(() {
                                        payment = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                Flexible(
                                  child: RadioListTile(
                                    title: Text("Offline"),
                                    value: "Offline",
                                    groupValue: payment,
                                    onChanged: (value) {
                                      setState(() {
                                        payment = value.toString();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: InkWell(
                        onTap: () {
                          if (kDebugMode) {
                            print("About this eBook");
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Order Info",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Subtotal'),
                                Text(
                                  '₹ 700',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Shipping cost'),
                                Text(
                                  '₹ 299',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Total',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '₹ 999',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: double.maxFinite,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.snackbar(
                                  widget.bookName, 'Order Placed Successfully');
                              Get.offAll(OrderPlaced());
                            },
                            child: const Text("Checkout (₹ 999)"))),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}

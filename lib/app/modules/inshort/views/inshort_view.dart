import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/inshort_controller.dart';

class InshortView extends GetView<InshortController> {
  const InshortView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InshortView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InshortView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

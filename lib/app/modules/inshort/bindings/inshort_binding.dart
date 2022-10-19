import 'package:get/get.dart';

import '../controllers/inshort_controller.dart';

class InshortBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InshortController>(
      () => InshortController(),
    );
  }
}

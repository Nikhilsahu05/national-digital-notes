import 'package:get/get.dart';

import '../modules/inshort/bindings/inshort_binding.dart';
import '../modules/inshort/views/inshort_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();


  static final routes = [
    GetPage(
      name: _Paths.INSHORT,
      page: () => const InshortView(),
      binding: InshortBinding(),
    ),
  ];
}

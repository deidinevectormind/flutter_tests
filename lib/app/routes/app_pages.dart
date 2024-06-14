import 'package:get/get.dart';

import '../modules/create_company/bindings/create_company_binding.dart';
import '../modules/create_company/views/create_company_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_COMPANY,
      page: () => CreateCompanyView(),
      binding: CreateCompanyBinding(),
    ),
  ];
}

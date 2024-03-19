import 'package:get/get.dart';
import 'package:trivia_mobile/app/modules/home/bindings/home_binding.dart';
import 'package:trivia_mobile/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage<void>(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

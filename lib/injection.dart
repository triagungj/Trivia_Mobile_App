import 'package:get/get.dart';
import 'package:trivia_mobile/app/core/network/api_service.dart';

Future<void> injection() async {
  Get.put(ApiService());
}

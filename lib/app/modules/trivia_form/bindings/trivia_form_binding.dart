import 'package:get/get.dart';
import 'package:trivia_mobile/app/modules/trivia_form/controllers/trivia_form_controller.dart';

class TriviaFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TriviaFormController>(
      TriviaFormController.new,
    );
  }
}

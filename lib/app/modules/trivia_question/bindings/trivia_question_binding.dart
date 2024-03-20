import 'package:get/get.dart';
import 'package:trivia_mobile/app/modules/trivia_question/controllers/trivia_question_controller.dart';

class TriviaQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TriviaQuestionController>(
      TriviaQuestionController.new,
    );
  }
}

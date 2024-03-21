import 'package:get/get.dart';
import 'package:trivia_mobile/app/modules/trivia_question/class/trivia_showed_answer_argument.dart';
import 'package:trivia_mobile/app/modules/trivia_showed_answer/controllers/trivia_showed_answer_controller.dart';

class TriviaShowedAnswerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TriviaShowedAnswerController>(
      TriviaShowedAnswerController(
        argument: Get.arguments as TriviaShowedAnswerArgument,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia_mobile/app/modules/trivia_question/class/trivia_showed_answer_argument.dart';

class TriviaShowedAnswerController extends GetxController {
  TriviaShowedAnswerController({required this.argument});

  final TriviaShowedAnswerArgument argument;

  @override
  void onReady() {
    super.onReady();
    var corectAnswer = 0;
    for (var index = 0; index < argument.listAnswer.length; index++) {
      if (argument.listAnswer[index] ==
          argument.listQuestion[index].correctAnswer) {
        corectAnswer++;
      }
    }
    Get.dialog<void>(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
              const Text("You've answer"),
              Text(
                '''${(corectAnswer / argument.listAnswer.length * 100).toInt()}% Correct''',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
              ),
              Text('from ${argument.listQuestion.length} Questions'),
            ],
          ),
        ),
      ),
    );
  }
}

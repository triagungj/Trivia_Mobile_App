import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia_mobile/app/modules/trivia_question/class/trivia_showed_answer_argument.dart';

class TriviaShowedAnswerController extends GetxController {
  TriviaShowedAnswerController({required this.argument});

  final TriviaShowedAnswerArgument argument;
  final _currentIndex = RxInt(0);
  int get currentIndex => _currentIndex.value;

  final _precentage = RxDouble(0);
  double get precentage => _precentage.value;

  void increment() => _currentIndex.value++;
  void decrement() => _currentIndex.value--;

  void updatePrecentage() {
    _precentage.value =
        (_currentIndex.value + 1) / argument.listQuestion.length;
  }

  @override
  void onInit() {
    updatePrecentage();
    super.onInit();
  }

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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get
                          ..close(1)
                          ..back<void>();
                      },
                      child: const Text('Back to Home'),
                    ),
                    const SizedBox(width: 10),
                    FilledButton(
                      onPressed: () {
                        Get.close(1);
                      },
                      child: const Text('Show Answers'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

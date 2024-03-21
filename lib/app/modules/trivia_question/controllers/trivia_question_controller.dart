import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:trivia_mobile/app/data/model/trivia_form_model.dart';
import 'package:trivia_mobile/app/modules/trivia_question/class/trivia_showed_answer_argument.dart';
import 'package:trivia_mobile/app/routes/app_pages.dart';

class TriviaQuestionController extends GetxController {
  final triviaQuestionKey = GlobalKey<FormBuilderState>();
  final _totalQuestion = RxInt(0);

  final _currentIndex = RxInt(0);
  int get currentIndex => _currentIndex.value;

  final _answeredQuestion = RxInt(0);
  int get answeredQuestion => _answeredQuestion.value;

  final _precentage = RxDouble(0);
  double get precentage => _precentage.value;

  void increment() => _currentIndex.value++;
  void decrement() => _currentIndex.value--;

  int get totalQuestion => _totalQuestion.value;
  set totalQuestion(int value) => _totalQuestion.value = value;

  void updatePrecentage() {
    const formName = 'question#';

    var answered = 0;

    for (var i = 0; i < _totalQuestion.value; i++) {
      if (triviaQuestionKey.currentState!.instantValue['$formName$i'] != null) {
        answered++;
      }
      _answeredQuestion.value = answered;
      _precentage.value = answered / _totalQuestion.value;
    }
  }

  void confirmAswer(
    List<TriviaFormDataModel> questions,
  ) {
    const formName = 'question#';
    final listAnswer = <String?>[];
    var totalAnswered = 0;

    for (var i = 0; i < _totalQuestion.value; i++) {
      listAnswer.add(
        triviaQuestionKey.currentState!.instantValue['$formName$i'] as String?,
      );
      if (triviaQuestionKey.currentState!.instantValue['$formName$i'] != null) {
        totalAnswered++;
      }
    }

    Get.dialog<void>(
      Dialog(
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(
            maxHeight: 600,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Submit Your Answer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        listAnswer.length,
                        (index) => Text(
                          '''${index + 1}. ${listAnswer[index] != null ? 'Answered' : 'Not Answered'}''',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: listAnswer[index] != null
                                ? FontWeight.normal
                                : FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.close(1);
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 20),
                  FilledButton(
                    onPressed: () {
                      Get
                        ..close(1)
                        ..offNamedUntil<void>(
                          Routes.TRIVIA_SHOWED_ANSWER,
                          arguments: TriviaShowedAnswerArgument(
                            listAnswer: listAnswer,
                            listQuestion: questions,
                            totalAnswered: totalAnswered,
                          ),
                          (route) {
                            return route.settings.name == Routes.HOME;
                          },
                        );
                    },
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

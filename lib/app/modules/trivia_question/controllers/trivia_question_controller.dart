import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

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
}

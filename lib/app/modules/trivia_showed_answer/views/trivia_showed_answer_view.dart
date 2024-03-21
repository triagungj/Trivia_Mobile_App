import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia_mobile/app/modules/trivia_showed_answer/controllers/trivia_showed_answer_controller.dart';

class TriviaShowedAnswerView extends GetView<TriviaShowedAnswerController> {
  const TriviaShowedAnswerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia'),
        centerTitle: true,
      ),
    );
  }
}

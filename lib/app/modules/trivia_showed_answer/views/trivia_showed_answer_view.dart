import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:onboarding/onboarding.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:trivia_mobile/app/modules/trivia_showed_answer/controllers/trivia_showed_answer_controller.dart';

class TriviaShowedAnswerView extends GetView<TriviaShowedAnswerController> {
  const TriviaShowedAnswerView({super.key});

  @override
  Widget build(BuildContext context) {
    final unescape = HtmlUnescape();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Obx(
            () => LinearPercentIndicator(
              percent: controller.precentage,
              curve: Curves.decelerate,
              animateFromLastPercent: true,
            ),
          ),
          Onboarding(
            onPageChanges: (
              netDragDistance,
              pagesLength,
              currentIndex,
              slideDirection,
            ) {},
            buildFooter: (
              context,
              netDragDistance,
              pagesLength,
              currentIndex,
              setIndex,
              slideDirection,
            ) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: controller.currentIndex != 0
                              ? () {
                                  setIndex(controller.currentIndex - 1);
                                  controller
                                    ..decrement()
                                    ..updatePrecentage();
                                }
                              : null,
                          style: TextButton.styleFrom(
                            shape: const BeveledRectangleBorder(),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.chevron_left,
                                size: 32,
                              ),
                              Text('Previous'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            if (controller.currentIndex !=
                                controller.argument.listQuestion.length - 1) {
                              setIndex(controller.currentIndex + 1);
                              controller
                                ..increment()
                                ..updatePrecentage();
                            } else {
                              Get.back<void>();
                            }
                          },
                          style: TextButton.styleFrom(
                            shape: const BeveledRectangleBorder(),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (controller.currentIndex !=
                                  controller.argument.listQuestion.length - 1)
                                const Text('Next')
                              else
                                const Text('Back to home'),
                              if (controller.currentIndex !=
                                  controller.argument.listQuestion.length - 1)
                                const Icon(
                                  Icons.chevron_right,
                                  size: 32,
                                )
                              else
                                const Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Icon(
                                    Icons.logout,
                                    size: 20,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            swipeableBody: List.generate(
              controller.argument.listQuestion.length,
              (index) {
                final formName = 'question#$index';
                final listAnswer = [
                  controller.argument.listQuestion[index].correctAnswer,
                  for (final i in controller
                      .argument.listQuestion[index].incorrectAnswers)
                    i,
                ]..shuffle();

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Question: ${controller.currentIndex + 1} / ${controller.argument.listQuestion.length}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text('Answered: '),
                                Text(
                                  '${controller.argument.totalAnswered} / ${controller.argument.listAnswer.length}',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        unescape.convert(
                          controller.argument.listQuestion[index].question,
                        ),
                      ),
                      FormBuilderRadioGroup(
                        name: formName,
                        orientation: OptionsOrientation.vertical,
                        enabled: false,
                        initialValue: controller.argument.listAnswer[index],
                        options: List.generate(
                          listAnswer.length,
                          (index) => FormBuilderFieldOption<String>(
                            value: listAnswer[index],
                            child: Text(unescape.convert(listAnswer[index])),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      if (controller.argument.listAnswer[index] ==
                          controller.argument.listQuestion[index].correctAnswer)
                        const Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            Text(
                              ' Correct!',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.disabled_by_default,
                                  color: Colors.red,
                                ),
                                Text(
                                  ' Incorrect!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text(
                                  'Correct Answer: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  unescape.convert(
                                    controller.argument.listQuestion[index]
                                        .correctAnswer,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:onboarding/onboarding.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:trivia_mobile/app/data/model/trivia_form_model.dart';
import 'package:trivia_mobile/app/modules/trivia_question/controllers/trivia_question_controller.dart';

class TriviaQuestionView extends GetView<TriviaQuestionController> {
  const TriviaQuestionView({
    required this.argument,
    super.key,
  });

  final List<TriviaFormDataModel> argument;

  @override
  Widget build(BuildContext context) {
    final unescape = HtmlUnescape();
    controller.totalQuestion = argument.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia'),
        centerTitle: true,
      ),
      body: FormBuilder(
        key: controller.triviaQuestionKey,
        child: Stack(
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
                                    controller.decrement();
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
                                  argument.length - 1) {
                                setIndex(controller.currentIndex + 1);
                                controller.increment();
                              } else {
                                controller.confirmAswer(argument);
                              }
                            },
                            style: TextButton.styleFrom(
                              shape: const BeveledRectangleBorder(),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (controller.currentIndex !=
                                    argument.length - 1)
                                  const Text('Next')
                                else
                                  const Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Icon(
                                      Icons.check,
                                      size: 32,
                                    ),
                                  ),
                                if (controller.currentIndex !=
                                    argument.length - 1)
                                  const Icon(
                                    Icons.chevron_right,
                                    size: 32,
                                  )
                                else
                                  const Text('Finish'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              swipeableBody: List.generate(argument.length, (index) {
                final formName = 'question#$index';
                final listAnswer = [
                  argument[index].correctAnswer,
                  for (final i in argument[index].incorrectAnswers) i,
                ]..shuffle();

                return ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Question: ${controller.currentIndex + 1} / ${argument.length}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text('Answered: '),
                              Text(
                                '${controller.answeredQuestion} / ${controller.totalQuestion}',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(unescape.convert(argument[index].question)),
                    FormBuilderRadioGroup(
                      name: formName,
                      orientation: OptionsOrientation.vertical,
                      onChanged: (newValue) {
                        controller.updatePrecentage();
                      },
                      options: List.generate(
                        listAnswer.length,
                        (index) => FormBuilderFieldOption<String>(
                          value: listAnswer[index],
                          child: Text(unescape.convert(listAnswer[index])),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.triviaQuestionKey.currentState!
                                .fields[formName]!
                                .reset();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Icon(Icons.delete),
                                Text(
                                  'Clear Answer',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

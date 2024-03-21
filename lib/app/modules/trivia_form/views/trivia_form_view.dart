import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:trivia_mobile/app/modules/trivia_form/class/difficulty_enum.dart';
import 'package:trivia_mobile/app/modules/trivia_form/class/question_type_enum.dart';
import 'package:trivia_mobile/app/modules/trivia_form/class/trivia_form_argument.dart';
import 'package:trivia_mobile/app/modules/trivia_form/controllers/trivia_form_controller.dart';

class TriviaFormView extends GetView<TriviaFormController> {
  const TriviaFormView({required this.argument, super.key});

  final TriviaFormArgument argument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia'),
        centerTitle: true,
      ),
      body: FormBuilder(
        key: controller.triviaFormKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormBuilderDropdown(
                name: 'categoryDropdown',
                initialValue: argument.selectedCategory.id,
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
                items: List.generate(
                  argument.categories.length,
                  (index) => DropdownMenuItem<int>(
                    value: argument.categories[index].id,
                    child: Text(argument.categories[index].name),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              FormBuilderTextField(
                name: 'questionTotal',
                initialValue: '10',
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Number of Question',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Required';
                  }
                  final total = int.parse(value);
                  if (total < 1) {
                    return 'Invalid Number. Minimum number is 1';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5),
              FormBuilderDropdown(
                name: 'difficultyDropdown',
                initialValue: DifficultyEnum.values.first,
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
                items: List.generate(
                  DifficultyEnum.values.length,
                  (index) => DropdownMenuItem<DifficultyEnum>(
                    value: DifficultyEnum.values[index],
                    child: Text(
                      DifficultyEnum.values[index].name.capitalizeFirst!,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              FormBuilderRadioGroup(
                name: 'typeRadio',
                initialValue: QuestionTypeEnum.values.first,
                decoration: const InputDecoration(
                  labelText: 'Questyion Type',
                ),
                options: List.generate(
                  QuestionTypeEnum.values.length,
                  (index) => FormBuilderFieldOption<QuestionTypeEnum>(
                    value: QuestionTypeEnum.values[index],
                    child: Text(
                      QuestionTypeEnum.values[index].name
                          .replaceAll('_', ' ')
                          .capitalize!,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Obx(
                  () => FilledButton(
                    onPressed: controller.state == TriviaFormState.loading
                        ? null
                        : () {
                            if (controller.triviaFormKey.currentState!
                                .validate()) {
                              controller.getTriviaForm();
                            }
                          },
                    child: controller.state == TriviaFormState.loading
                        ? const Padding(
                            padding: EdgeInsets.all(4),
                            child: CircularProgressIndicator(),
                          )
                        : const Text("Let's Go"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

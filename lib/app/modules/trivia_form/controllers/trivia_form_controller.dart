import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:trivia_mobile/app/data/body/trivia_form_body.dart';
import 'package:trivia_mobile/app/data/model/trivia_form_model.dart';
import 'package:trivia_mobile/app/data/repositories/main_repository.dart';
import 'package:trivia_mobile/app/modules/trivia_form/class/difficulty_enum.dart';
import 'package:trivia_mobile/app/modules/trivia_form/class/question_type_enum.dart';
import 'package:trivia_mobile/app/routes/app_pages.dart';

enum TriviaFormState {
  initial,
  loading,
  error,
  success,
}

class TriviaFormController extends GetxController {
  final triviaFormKey = GlobalKey<FormBuilderState>();

  final _mainRepository = MainRepository();

  final Rx<TriviaFormState> _state =
      Rx<TriviaFormState>(TriviaFormState.initial);
  TriviaFormState get state => _state.value;

  final Rx<TriviaFormModel?> _data = Rx<TriviaFormModel?>(null);
  TriviaFormModel? get data => _data.value;

  Future<void> getTriviaForm() async {
    try {
      _state.value = TriviaFormState.loading;
      final triviaFormBody = TriviaFormBody(
        amount:
            triviaFormKey.currentState?.instantValue['questionTotal'] as String,
        type: triviaFormKey.currentState?.instantValue['typeRadio']
            as QuestionTypeEnum?,
        category:
            triviaFormKey.currentState?.instantValue['categoryDropdown'] as int,
        difficulty: triviaFormKey
            .currentState?.instantValue['difficultyDropdown'] as DifficultyEnum,
      );

      _data.value = await _mainRepository.getTriviaFormData(
        triviaFormBody,
      );
      _state.value = TriviaFormState.success;
      if (_data.value == null || _data.value!.results.isEmpty) {
        Get.snackbar('Failed', 'No Trivia in selected Category');
      } else {
        await Get.toNamed<void>(
          Routes.TRIVIA_QUESTION,
          arguments: _data.value?.results,
        );
      }
    } catch (e) {
      _state.value = TriviaFormState.error;
      Get.snackbar('Failed', e.toString());
    }
  }
}

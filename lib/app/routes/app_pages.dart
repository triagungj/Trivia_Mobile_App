import 'package:get/get.dart';
import 'package:trivia_mobile/app/data/model/trivia_form_model.dart';
import 'package:trivia_mobile/app/modules/home/bindings/home_binding.dart';
import 'package:trivia_mobile/app/modules/home/views/home_view.dart';
import 'package:trivia_mobile/app/modules/trivia_form/bindings/trivia_form_binding.dart';
import 'package:trivia_mobile/app/modules/trivia_form/class/trivia_form_argument.dart';
import 'package:trivia_mobile/app/modules/trivia_form/views/trivia_form_view.dart';
import 'package:trivia_mobile/app/modules/trivia_question/bindings/trivia_question_binding.dart';
import 'package:trivia_mobile/app/modules/trivia_question/views/trivia_question_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage<void>(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage<void>(
      name: _Paths.TRIVIA_FORM,
      page: () => TriviaFormView(
        argument: Get.arguments as TriviaFormArgument,
      ),
      binding: TriviaFormBinding(),
    ),
    GetPage<void>(
      name: _Paths.TRIVIA_QUESTION,
      page: () => TriviaQuestionView(
        argument: Get.arguments as List<TriviaFormDataModel>,
      ),
      binding: TriviaQuestionBinding(),
    ),
  ];
}

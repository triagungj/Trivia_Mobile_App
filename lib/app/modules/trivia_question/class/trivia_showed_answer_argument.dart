import 'package:trivia_mobile/app/data/model/trivia_form_model.dart';

class TriviaShowedAnswerArgument {
  TriviaShowedAnswerArgument({
    required this.listAnswer,
    required this.listQuestion,
  });

  final List<String?> listAnswer;
  final List<TriviaFormDataModel> listQuestion;
}

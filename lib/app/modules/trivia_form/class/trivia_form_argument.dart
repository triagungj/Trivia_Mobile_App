import 'package:trivia_mobile/app/data/model/trivia_category_model.dart';

class TriviaFormArgument {
  TriviaFormArgument({
    required this.selectedCategory,
    required this.categories,
  });

  final TriviaCategoryDataModel selectedCategory;
  final List<TriviaCategoryDataModel> categories;
}

import 'package:get/get.dart';
import 'package:trivia_mobile/app/data/model/trivia_category_model.dart';
import 'package:trivia_mobile/app/data/repositories/main_repository.dart';

enum HomeState {
  initial,
  loading,
  error,
  success,
}

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  final _mainRepository = MainRepository();

  final Rx<HomeState> _state = Rx<HomeState>(HomeState.initial);
  HomeState get state => _state.value;

  final Rx<TriviaCategoryModel?> _data = Rx<TriviaCategoryModel?>(null);
  TriviaCategoryModel? get data => _data.value;

  Future<void> getCategory() async {
    try {
      _state.value = HomeState.loading;
      _data.value = await _mainRepository.getCategoryData();
      _state.value = HomeState.success;
    } catch (e) {
      _state.value = HomeState.error;
      Get.snackbar('Failed', e.toString());
    }
  }
}

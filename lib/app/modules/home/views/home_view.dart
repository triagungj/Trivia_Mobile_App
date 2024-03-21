import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:trivia_mobile/app/modules/trivia_form/class/trivia_form_argument.dart';
import 'package:trivia_mobile/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final randomTeal = [500, 600, 700, 800, 900];
    final randomColor = [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.brown,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia'),
        centerTitle: true,
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: controller.getCategory,
          child: Stack(
            children: [
              if (controller.state == HomeState.loading &&
                  controller.data == null)
                const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 5),
                      Text('Load Data...'),
                    ],
                  ),
                ),
              if (controller.data != null)
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Select Category',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        shrinkWrap: true,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: List.generate(
                            controller.data!.triviaCategories.length, (index) {
                          final randomColorNumber =
                              Random().nextInt(randomColor.length);
                          final randomTealNumber =
                              Random().nextInt(randomTeal.length);

                          return Card(
                            color: randomColor[randomColorNumber]
                                [randomTeal[randomTealNumber]],
                            child: InkWell(
                              onTap: () {
                                Get.toNamed<void>(
                                  Routes.TRIVIA_FORM,
                                  arguments: TriviaFormArgument(
                                    selectedCategory: controller
                                        .data!.triviaCategories[index],
                                    categories:
                                        controller.data!.triviaCategories,
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  controller.data!.triviaCategories[index].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

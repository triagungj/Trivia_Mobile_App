import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia_mobile/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia'),
      ),
      body: const Column(
        children: [
          Text('Hello'),
        ],
      ),
    );
  }
}

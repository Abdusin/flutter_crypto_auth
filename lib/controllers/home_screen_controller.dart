import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController with GetTickerProviderStateMixin {
  late final animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 8000),
  );

  late final rotationAnimation = Tween<double>(
    begin: 0,
    end: 2 * pi,
  ).animate(animationController);

  @override
  void onInit() {
    super.onInit();
    animationController.repeat();
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }
}

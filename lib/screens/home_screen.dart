import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin/controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: Stack(
              children: [
                Positioned(
                  top: Get.width / -2,
                  child: Transform.scale(
                    scale: 1.2,
                    child: AnimatedBuilder(
                      animation: controller.rotationAnimation,
                      builder: (context, _) => Stack(
                        fit: StackFit.loose,
                        alignment: Alignment.center,
                        children: [
                          CircleWidget(
                            angle: controller.rotationAnimation.value,
                            size: Get.width * 0.4,
                            firstImageUrl: 'assets/eth.png',
                            secondImageUrl: 'assets/luna.png',
                          ),
                          CircleWidget(
                            angle: controller.rotationAnimation.value + 180,
                            size: Get.width * 0.7,
                            firstImageUrl: 'assets/ens.png',
                            secondImageUrl: 'assets/sol.png',
                          ),
                          CircleWidget(
                            angle: controller.rotationAnimation.value + 90,
                            size: Get.width,
                            firstImageUrl: 'assets/btc.png',
                            secondImageUrl: 'assets/xrp.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    color: Colors.white.withOpacity(0.2),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(height: Get.width / 2),
                        const Text(
                          'Welcome to Bitcoin',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'The world\'s first blockchain-based digital currency',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 50),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your wallet address',
                            hintStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {},
                          child: Column(
                            children: [
                              const Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: Get.width / 3.8,
                                height: 0.6,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fixedSize: Size(Get.width * 0.6, 50),
                            splashFactory: InkRipple.splashFactory,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        // register button
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fixedSize: Size(Get.width * 0.6, 50),
                            splashFactory: InkRipple.splashFactory,
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    Key? key,
    required this.angle,
    required this.size,
    required this.firstImageUrl,
    required this.secondImageUrl,
  }) : super(key: key);
  final double angle;
  final double size;
  final String firstImageUrl;
  final String secondImageUrl;
  final double radius = 35;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(radius / 2),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.7), width: 1.1),
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: radius,
                height: radius,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    secondImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: radius,
                height: radius,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    firstImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

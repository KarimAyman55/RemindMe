import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/Controllers.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        init: LocationController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Get Current Location'),
            ),
            body: Center(
              child: controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      controller.currentLocation == null
                          ? 'No address found , please press to get current location'
                          : controller.currentLocation!,
                      style: const TextStyle(fontSize: 20,color: Colors.indigo),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.getCurrentLocation();
                    },
                    child: const Text('Get Current Location'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

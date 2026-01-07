import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/user_profile_modal.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Personal Information
  final firstNameController = TextEditingController(text: 'Kumar');
  final lastNameController = TextEditingController(text: 'Kumar');
  final emailController = TextEditingController(text: 'utkarsh@mobrilz.com');
  final mobileController = TextEditingController(text: '+2963258962');
  final organizationController = TextEditingController();

  // Settings
  final autoRefresh = true.obs;
  final autoRenew = true.obs;

  // Aircraft Fleet
  final aircraftFleet = <AircraftFleet>[].obs;

  // Subscription
  final remainingFlights = 99.obs;
  final remainingSMS = 99.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with empty fleet items
    aircraftFleet.addAll([
      AircraftFleet(),
      AircraftFleet(),
    ]);
  }

  void addAircraft() {
    aircraftFleet.add(AircraftFleet());
  }

  void removeAircraft(int index) {
    if (aircraftFleet.length > 1) {
      aircraftFleet.removeAt(index);
    }
  }

  void updatePassword() {
    Get.snackbar(
      'Update Password',
      'Password update functionality',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void changeLogo() {
    Get.snackbar(
      'Change Logo',
      'Logo change functionality',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void applyPersonalInfo() {
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        'Success',
        'Personal information updated',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void applyFleet() {
    Get.snackbar(
      'Success',
      'Aircraft fleet updated',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }


  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    organizationController.dispose();
    super.onClose();
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestModel {
  String email;
  String firstName;
  String role;
  bool fullActionsView;
  bool statusBarAccess;
  bool overrideAccess;
  bool autoInvite;
  String status;

  GuestModel({
    this.email = '',
    this.firstName = '',
    this.role = 'Observer',
    this.fullActionsView = false,
    this.statusBarAccess = false,
    this.overrideAccess = false,
    this.autoInvite = false,
    this.status = 'Pending Invite',
  });
}

class AddFlightController extends GetxController {
  RxBool isLoading = false.obs;

  // Flight Info
  final flightNumber = TextEditingController();
  final flightReference = TextEditingController();
  final startingPoint = TextEditingController();
  final destination = TextEditingController();
  final aircraftIdentifier = TextEditingController();
  final aircraftType = TextEditingController();
  final operator = TextEditingController();
  final remarks = TextEditingController();

  // Date & Time
  final departureDate = TextEditingController();
  final departureTime = TextEditingController();
  final arrivalDate = TextEditingController();
  final arrivalTime = TextEditingController();
  final duration = TextEditingController();

  // Departure Information
  final departureHandler = TextEditingController();
  final departureAddress1 = TextEditingController();
  final departureAddress2 = TextEditingController();
  final departureCity = TextEditingController();
  final departureState = TextEditingController();
  final departureCountry = TextEditingController();
  final departureZip = TextEditingController();
  final departureSupportNumber = TextEditingController();

  // Arrival Information
  final arrivalHandler = TextEditingController();
  final arrivalAddress1 = TextEditingController();
  final arrivalAddress2 = TextEditingController();
  final arrivalCity = TextEditingController();
  final arrivalState = TextEditingController();
  final arrivalCountry = TextEditingController();
  final arrivalZip = TextEditingController();
  final arrivalSupportNumber = TextEditingController();

  // Guest Management
  RxBool showGuestFields = false.obs;
  RxList<GuestModel> guests = <GuestModel>[].obs;

  // Current guest being added/edited
  final guestEmail = TextEditingController();
  final guestFirstName = TextEditingController();
  Rx<String> guestRole = 'Observer'.obs;
  RxBool guestFullActionsView = false.obs;
  RxBool guestStatusBarAccess = false.obs;
  RxBool guestOverrideAccess = false.obs;
  RxBool guestAutoInvite = false.obs;

  /// Toggle guest fields visibility
  void toggleGuestFields() {
    showGuestFields.value = !showGuestFields.value;
    if (showGuestFields.value) {
      // Reset guest form when opening
      clearGuestForm();
    }
  }

  /// Add a new guest
  void addGuest() {
    if (guestEmail.text.isEmpty || guestFirstName.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter guest email and first name",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final newGuest = GuestModel(
      email: guestEmail.text,
      firstName: guestFirstName.text,
      role: guestRole.value,
      fullActionsView: guestFullActionsView.value,
      statusBarAccess: guestStatusBarAccess.value,
      overrideAccess: guestOverrideAccess.value,
      autoInvite: guestAutoInvite.value,
    );

    guests.add(newGuest);
    clearGuestForm();
    showGuestFields.value = false;

    Get.snackbar(
      "Success",
      "Guest added successfully",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  /// Remove a guest
  void removeGuest(int index) {
    if (index >= 0 && index < guests.length) {
      guests.removeAt(index);
      Get.snackbar(
        "Removed",
        "Guest removed successfully",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  /// Update guest role
  void updateGuestRole(int index, String newRole) {
    if (index >= 0 && index < guests.length) {
      guests[index].role = newRole;
      guests.refresh();
    }
  }

  /// Update guest permissions
  void updateGuestPermission(int index, String permissionType, bool value) {
    if (index >= 0 && index < guests.length) {
      switch (permissionType) {
        case 'fullActionsView':
          guests[index].fullActionsView = value;
          break;
        case 'statusBarAccess':
          guests[index].statusBarAccess = value;
          break;
        case 'overrideAccess':
          guests[index].overrideAccess = value;
          break;
        case 'autoInvite':
          guests[index].autoInvite = value;
          break;
      }
      guests.refresh();
    }
  }

  /// Clear guest form
  void clearGuestForm() {
    guestEmail.clear();
    guestFirstName.clear();
    guestRole.value = 'Observer';
    guestFullActionsView.value = false;
    guestStatusBarAccess.value = false;
    guestOverrideAccess.value = false;
    guestAutoInvite.value = false;
  }

  /// Save flight
  void saveFlight() async {
    // Validate required fields
    if (flightNumber.text.isEmpty ||
        startingPoint.text.isEmpty ||
        destination.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill required fields (Flight Number, Starting Point, Destination)",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
      );
      return;
    }

    try {
      isLoading.value = true;

      // Prepare flight data
      Map<String, dynamic> flightData = {
        'flightNumber': flightNumber.text,
        'flightReference': flightReference.text,
        'startingPoint': startingPoint.text,
        'destination': destination.text,
        'aircraftIdentifier': aircraftIdentifier.text,
        'aircraftType': aircraftType.text,
        'operator': operator.text,
        'remarks': remarks.text,
        'departureDate': departureDate.text,
        'departureTime': departureTime.text,
        'arrivalDate': arrivalDate.text,
        'arrivalTime': arrivalTime.text,
        'duration': duration.text,
        'departure': {
          'handler': departureHandler.text,
          'address1': departureAddress1.text,
          'address2': departureAddress2.text,
          'city': departureCity.text,
          'state': departureState.text,
          'country': departureCountry.text,
          'zip': departureZip.text,
          'supportNumber': departureSupportNumber.text,
        },
        'arrival': {
          'handler': arrivalHandler.text,
          'address1': arrivalAddress1.text,
          'address2': arrivalAddress2.text,
          'city': arrivalCity.text,
          'state': arrivalState.text,
          'country': arrivalCountry.text,
          'zip': arrivalZip.text,
          'supportNumber': arrivalSupportNumber.text,
        },
        'guests': guests.map((guest) => {
          'email': guest.email,
          'firstName': guest.firstName,
          'role': guest.role,
          'fullActionsView': guest.fullActionsView,
          'statusBarAccess': guest.statusBarAccess,
          'overrideAccess': guest.overrideAccess,
          'autoInvite': guest.autoInvite,
        }).toList(),
      };

      // 🔹 Simulate API Call
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Replace with actual API call
      // final response = await ApiService.createFlight(flightData);

      print('Flight Data: $flightData'); // Debug print

      isLoading.value = false;

      Get.snackbar(
        "Success",
        "Flight Added Successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade100,
        duration: const Duration(seconds: 3),
      );

      // Navigate back or to next screen
      Get.back();

    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
      );
    }
  }

  @override
  void onClose() {
    // Dispose all text controllers
    flightNumber.dispose();
    flightReference.dispose();
    startingPoint.dispose();
    destination.dispose();
    aircraftIdentifier.dispose();
    aircraftType.dispose();
    operator.dispose();
    remarks.dispose();
    departureDate.dispose();
    departureTime.dispose();
    arrivalDate.dispose();
    arrivalTime.dispose();
    duration.dispose();
    departureHandler.dispose();
    departureAddress1.dispose();
    departureAddress2.dispose();
    departureCity.dispose();
    departureState.dispose();
    departureCountry.dispose();
    departureZip.dispose();
    departureSupportNumber.dispose();
    arrivalHandler.dispose();
    arrivalAddress1.dispose();
    arrivalAddress2.dispose();
    arrivalCity.dispose();
    arrivalState.dispose();
    arrivalCountry.dispose();
    arrivalZip.dispose();
    arrivalSupportNumber.dispose();
    guestEmail.dispose();
    guestFirstName.dispose();
    super.onClose();
  }
}
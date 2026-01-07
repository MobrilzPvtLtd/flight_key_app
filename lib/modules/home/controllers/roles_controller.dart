import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RolesController extends GetxController {
  // Show/Hide action form
  RxBool showActionForm = false.obs;

  // Role Information
  Rx<String> selectedRole = 'Create New Role'.obs;
  final roleName = TextEditingController();
  RxBool isPrivate = false.obs;
  RxBool isPassengerRole = false.obs;

  // Action Form Fields
  final categoryName = TextEditingController();
  final actionName = TextEditingController();
  RxBool addDeadline = false.obs;
  final deadline = TextEditingController();
  Rx<String> deadlineUnit = 'Min'.obs;
  RxBool notifications = false.obs;
  Rx<String> initialStatus = 'Not Completed'.obs;

  // Actions list
  RxList<Map<String, dynamic>> actions = <Map<String, dynamic>>[].obs;

  // Pagination
  RxInt entriesPerPage = 10.obs;

  void toggleActionForm() {
    showActionForm.value = !showActionForm.value;
    if (showActionForm.value) {
      // Reset form when opening
      clearActionForm();
    }
  }

  void addAction() {
    if (categoryName.text.isEmpty || actionName.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter category and action name",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final newAction = {
      'categoryName': categoryName.text,
      'actionName': actionName.text,
      'addDeadline': addDeadline.value,
      'deadline': deadline.text,
      'deadlineUnit': deadlineUnit.value,
      'notifications': notifications.value,
      'initialStatus': initialStatus.value,
    };

    actions.add(newAction);
    clearActionForm();
    showActionForm.value = false;

    Get.snackbar(
      "Success",
      "Action added successfully",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeAction(int index) {
    if (index >= 0 && index < actions.length) {
      actions.removeAt(index);
      Get.snackbar(
        "Removed",
        "Action removed successfully",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void clearActionForm() {
    categoryName.clear();
    actionName.clear();
    addDeadline.value = false;
    deadline.clear();
    deadlineUnit.value = 'Min';
    notifications.value = false;
    initialStatus.value = 'Not Completed';
  }

  void deleteRole() {
    Get.defaultDialog(
      title: "Delete Role",
      middleText: "Are you sure you want to delete this role?",
      textConfirm: "Delete",
      textCancel: "Cancel",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        // Clear all data
        roleName.clear();
        isPrivate.value = false;
        isPassengerRole.value = false;
        actions.clear();
        Get.back();
        Get.snackbar(
          "Deleted",
          "Role deleted successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade100,
        );
      },
    );
  }

  void saveRole() {
    if (roleName.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter a role name",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
      );
      return;
    }

    // Prepare role data
    Map<String, dynamic> roleData = {
      'roleName': roleName.text,
      'isPrivate': isPrivate.value,
      'isPassengerRole': isPassengerRole.value,
      'actions': actions.toList(),
    };

    // TODO: Call API to save role
    // await ApiService.saveRole(roleData);

    print('Role Data: $roleData'); // Debug print

    Get.snackbar(
      "Success",
      "Role saved successfully",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade100,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void onClose() {
    roleName.dispose();
    categoryName.dispose();
    actionName.dispose();
    deadline.dispose();
    super.onClose();
  }
}
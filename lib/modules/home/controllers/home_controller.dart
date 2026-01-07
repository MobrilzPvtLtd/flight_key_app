import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List<String> titles = [
    // 'Dashboard',
    'My Flights',
    'New Flight',
    'Roles & Actions',
    'Plans & Pricing',
  ];

  void changeTab(int index) {
    currentIndex.value = index;
  }

  String get currentTitle => titles[currentIndex.value];
}

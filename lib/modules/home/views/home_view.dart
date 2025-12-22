import 'package:flight_key_app/modules/home/views/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../tabs/dashboard.dart';
import '../tabs/flights_tab.dart';
import '../tabs/pricing_tab.dart';
import '../tabs/roles_tab.dart';


class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  final pages = [
    const DashboardTab(),
    const FlightsTab(),
    const RolesTab(),
    const PricingTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1b7bcd),
        title: Obx(
              () => Text(
            controller.currentTitle,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              backgroundColor: Color(0xFF1b7bcd),
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          selectedItemColor:  Colors.white,
          unselectedItemColor: Colors.white70,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flight),
              label: 'My Flights',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.security),
              label: 'Roles',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: 'Pricing',
            ),
          ],
        ),
      ),
    );
  }
}
